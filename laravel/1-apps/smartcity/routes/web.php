<?php
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

use App\Http\Controllers\frontend\HomeController;
use App\Http\Controllers\frontend\ProjectController;
use App\Http\Controllers\frontend\ActivitesController;

use App\Http\Controllers\backend\AuthController;
use App\Http\Controllers\backend\BannerController;
use App\Http\Controllers\backend\CategoriesController;
use App\Http\Controllers\backend\ActivitiesController;
use App\Http\Controllers\backend\ProjectsController;


Route::get('/', [HomeController::class,'Home'])->name('home');
Route::get('/getprojects', [ProjectController::class,'Projects']);
Route::get('/projectscategory/{category}', [ProjectController::class,'ProjectCategory']);
Route::get('/projectsdetails/{id}', [ProjectController::class,'ProjectDetails']);
Route::get('/activitiesdetails/{id}', [ActivitesController::class,'Activities']);


Route::get('/login',  [AuthController::class,'Login']);
Route::post('/login', [AuthController::class,'LoginPost']);

Route::delete('/logout', [AuthController::class,'Logout']);

Route::get('/resetpass', [AuthController::class,'ResetPassword']);
Route::post('/resetpass', [AuthController::class,'ResetPasswordPost']);


Route::middleware(['checkSession'])->group(function () {
    Route::resource('/admin/banner', BannerController::class);
    Route::resource('/admin/banner/{id}/edit', BannerController::class);

    Route::resource('/admin/categories', CategoriesController::class);
    Route::resource('/admin/categories/store', CategoriesController::class);
    Route::resource('/admin/categories/{id}/edit', CategoriesController::class);

    Route::resource('/admin/activities', ActivitiesController::class);
    Route::resource('/admin/activities/store', ActivitiesController::class);
    Route::resource('/admin/activities/{id}/edit', ActivitiesController::class);

    Route::resource('/admin/projects', ProjectsController::class);
    Route::resource('/admin/projects/store', ProjectsController::class);
    Route::resource('/admin/projects/{id}/edit', ProjectsController::class);

    //delete
    Route::post('/admin/categories/delete', function(Request $requestuest){
        DB::table('categories')->where('id', $requestuest->id, 1)->delete();
        File::deleteDirectory(public_path('uploads/categories/'.$requestuest->category));
        $data = DB::table('projects')->where('category', $requestuest->category)->get(['title']);
        foreach($data as $item){
            DB::table('projects')->where('title', $item->title)->delete();
            File::deleteDirectory(public_path('uploads/projects/'.$item->title));
        }
        return $data;
    });

    Route::post('/admin/project/delete', function(Request $requestuest){
        DB::table('projects')->where('id', $requestuest->id, 1)->delete();
        File::deleteDirectory(public_path('uploads/projects/'.$requestuest->project));
        return '200';
    });
    
    Route::post('/admin/activity/delete', function(Request $requestuest){
        DB::table('activities')->where('id', $requestuest->id, 1)->delete();
        File::deleteDirectory(public_path('uploads/activities/'.$requestuest->activiti));
        return '200';
    });
   
    //image
    Route::get('/admin/uploadimage', function(){
        return view('backend.pages.uploadimage');
    });
    
    Route::post('/admin/uploadimage/', function(Request $request){
       $fileName = $request->file->getClientOriginalName();
        DB::table('images')->insert([
            'maincategory'=>$request->maincategory,
            'subcategory'=>$request->subcategory,
            'imgname'=>'uploads/'.$request->maincategory.'/'.$request->subcategory.'/'.$fileName
        ]);
        $request->file->move(public_path('uploads/'.$request->maincategory.'/'.$request->subcategory.'/'), $fileName);
        return $fileName;
    });
    
    Route::post('/admin/getsubcategory', function(Request $request){
        $data['result'] = DB::table($request->type)->orderBy('title')->get();
        return $data;
    });
    
    Route::post('/admin/getimages', function(Request $request){
        return $data['imgname'] = DB::table('images')->where('subcategory', $request->subcategory)->get(['imgname']);
    });
    
    Route::post('/admin/deleteimage', function(Request $request){
        DB::table('images')->where('imgname', $request->imgname, 1)->delete();
        File::delete($request->imgname);
        return '200';
    });

    
});