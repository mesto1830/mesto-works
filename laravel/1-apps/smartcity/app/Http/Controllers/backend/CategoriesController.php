<?php
namespace App\Http\Controllers\backend;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Category;

class CategoriesController extends Controller
{
    public function index()
    {
        $data['result'] = DB::table('categories')->get();
        return view('backend.pages.categories.index', $data);
    }

    public function create()
    {
        return view('backend.pages.categories.create');
    }

    public function store(Request $request)
    {
        $data['category'] = DB::table('categories')->where('category', $request->category)->get();
        if(count($data['category']) > 0){
            return redirect()->route('categories.create')->withErrors('Bu Kategori Sistemde Kayıtlıdır');
        }
        $fileName = $request->file->getClientOriginalName();
        $request->file->move(public_path('uploads/categories/'.$request->category), $fileName);
        DB::table('categories')->insert([
            'category'=>$request->category,
            'img'=>$fileName
        ]);
        return redirect('admin/categories');
    }

    public function show($id)
    {
    }

    public function edit($id)
    {
        $category = DB::table('categories')->where('id',$id,1)->get();
        return view('backend.pages.categories.edit', compact('category'));
    }

    public function update(Request $request, $id)
    {
        if($request->hasFile('img')){
            $fileName = $request->img->getClientOriginalName();
            $request->img->move(public_path('uploads/categories/'.$request->category), $fileName);
            $request->merge(['img' => $fileName]);
        }
        Category::find($id)->update($request->post());
        return redirect('admin/categories');
    }

    public function destroy($id)
    {
    }
}
