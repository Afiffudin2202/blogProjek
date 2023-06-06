@extends('dashboard.layouts.main')
@section('container')
    <div class="container">
        <div class="row my-3">
            <div class="col-md-8">
                <h1 class="mb-3">{{ $post->title }}</h1>
                <a href="/dashboard/posts" class="btn btn-success"><span  data-feather="arrow-left" class="align-text-bottom"></span>Back to all my posts</a>
                <a href="/dashboard/posts/{{ $post->slug }}/edit" class="btn btn-warning"><span  data-feather="edit" class="align-text-bottom"></span>Edit</a>
                <form action="/dashboard/posts/{{ $post->slug }}" method="post" class="d-inline">
                    @method('delete')
                    @csrf
                    <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure ?')"><span  data-feather="x-circle" class="align-text-bottom"></span> Delete</button>
                </form>
                @if ($post->image)
                    <div style="max-height:400px; overflow:hidden">
                    <img src="{{ asset('storage/' . $post->image) }}" alt="" class="img-fluid mt-3">
                    </div>
                @else
                <img src="https://source.unsplash.com/1000x400?{{ $post->category->name }}" alt="" class="img-fluid mt-3">
                @endif
                
                <article class="mt-3">
                    {!! $post->body !!}
                </article>

                  <a href="/dashboard/posts" class="text-decoration-none d-block mt-3">Back to post</a>
            </div>
        </div>
    </div>
@endsection
