<?php
namespace App\Http\Controllers\backend;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use App\Models\Activity;

class ActivitiesController extends Controller
{
    public function index()
    {
        $data['result'] = DB::table('activities')->get();
        return view('backend.pages.activities.index', $data);
    }

    public function create()
    {
        return view('backend.pages.activities.create');
    }

    public function store(Request $request)
    {
        $data['title'] = DB::table('activities')->where('title', $request->title)->get();
        if(count($data['title']) > 0){
            return redirect()->route('activities.create')->withErrors('Bu Etkinlik Sistemde Kayıtlıdır');
        }
        $fileName = $request->file->getClientOriginalName();
        $request->file->move(public_path('uploads/activities/'.$request->title), $fileName);
        DB::table('activities')->insert([
            'title'=>$request->title,
            'text'=>$request->text,
            'img'=>$fileName,
        ]);
        return redirect('admin/activities');
    }

    public function show($id)
    {
    }

    public function edit($id)
    {
        $activity = DB::table('activities')->where('id',$id,1)->get();
        return view('backend.pages.activities.edit', compact('activity'));
    }

    public function update(Request $request, $id)
    {
        if($request->hasFile('img')){
            $fileName = 'cover.'.$request->img->extension();
            $request->img->move(public_path('uploads/activities/'.$request->title), $fileName);
            $request->merge(['img' => $fileName]);
        }
        Activity::find($id)->update($request->post());
        return redirect('admin/activities');
    }

    public function destroy($id)
    {
    }
}
