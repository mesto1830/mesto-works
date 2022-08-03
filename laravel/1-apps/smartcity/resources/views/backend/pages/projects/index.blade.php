@extends('backend.master')
@section('content')
<div class="admin-container">
    <div class="row admin-rows">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <a href="{{ route('projects.create') }}" class="btn btn-primary">Proje Ekle</a>
          <table class="table admin-table">
              <thead>
                  <tr class="list-column">
                      <th scope="col" class="col-2" style="text-align: left;">Resim</th>
                      <th scope="col">Kategori</th>
                      <th scope="col">Başlık</th>
                      <th scope="col">Text</th>
                      <th scope="col">İşlemler</th>
                  </tr>
              </thead>
              <tbody>
                  @isset($result)
                    @foreach($result as $item)
                        <tr class="list-rows">
                            <td scope="col" class="col-2" style="text-align: left;"><img src="{{ asset('/uploads/projects/'.$item->title.'/'.$item->img)}}" alt="" width="60"></td>
                            <td scope="col">{{ $item->category }}</td>
                            <td scope="col">{{ $item->title }}</td>
                            <td scope="col"><textarea class="adding-text" cols="30" rows="1" disabled>{{ $item->text }}</textarea></td>
                            <td scope="col" style="display: flex;">
                                <a href="{{route('projects.edit', $item->id)}}" class="del-btn-warning" id="edit-project">Düzenle</a>
                                <button class="del-btn-danger" onclick="deleteProject({{$item->id}},'{{$item->title}}', event)">Sil</button>
                            </td>
                        </tr>
                    @endforeach
                  @endisset
                  @isset($msg)
                        {{$msg}}
                    @endisset
              </tbody>
          </table>
        </div>
    </div>
</div>
@stop
<script>
    //remove project
    const deleteProject = async (id,project, e) => {
        let check = "Bu proje silinsinmi?";
        if (confirm(check) == true) {
            const result = await fetch('/admin/project/delete',{
              method:'POST',
              headers: {
                  Accept: 'application/json',
                  'Content-Type': 'application/json',
                  'X-CSRF-TOKEN':'{{csrf_token()}}'
              },
              body:JSON.stringify({
                id: id,project:project
              })
            })
            if(result.status === 200){
                e.target.parentNode.parentNode.remove()
            }
        } else {
            check = "You canceled!";
        }
    }
</script>
