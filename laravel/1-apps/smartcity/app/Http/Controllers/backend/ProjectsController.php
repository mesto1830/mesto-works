<?php
namespace App\Http\Controllers\backend;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Project;

class ProjectsController extends Controller
{
    public function index()
    {
        $data['result'] = DB::table('projects')->get();
        return view('backend.pages.projects.index', $data);
    }

    public function create()
    {
        $data['categories'] = DB::table('categories')->get('category');
        return view('backend.pages.projects.create', $data);
    }

    public function store(Request $request)
    {
        $data['title'] = DB::table('projects')->where('title', $request->title)->get();
        if(count($data['title']) > 0){
            return redirect()->route('projects.create')->withErrors('Bu Proje Sistemde Kayıtlıdır');
        }
        $fileName = $request->file->getClientOriginalName();
        $request->file->move(public_path('uploads/projects/'.$request->title), $fileName);
        DB::table('projects')->insert([
            'category'=>$request->category,
            'title'=>$request->title,
            'text'=>$request->text,
            'img'=>$fileName,
        ]);
        return redirect('admin/projects');
    }

    public function show($id)
    {
    }

    public function edit($id)
    {
        $data['projects'] = DB::table('projects')->where('id',$id,1)->get();
        $data['categories'] = DB::table('categories')->get('category');
        return view('backend.pages.projects.edit', $data);
    }

    public function update(Request $request, $id)
    {
        if($request->hasFile('img')){
            $fileName = 'cover.'.$request->img->extension();
            $request->img->move(public_path('uploads/projects/'.$request->title), $fileName);
            $request->merge(['img' => $fileName]);
        }
        Project::find($id)->update($request->post());
        return redirect('admin/projects');

    }

    public function destroy($id)
    {
    }
}
