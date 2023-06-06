@extends('layouts.main')
@section('container')
    <h1 class="mb-3 text-center">{{ $title }}</h1>
    {{-- search --}}
    <div class="row justify-content-center mb-3">
        <div class="col-md-6">
            <form action="/blog" method="get">
                @if (request('category'))
                     <input type="hidden" name="category" value="{{ Request('category') }}">
                @endif
                @if (request('author'))
                    <input type="hidden" name="author" value="{{ Request('author') }}">
                @endif
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Search..." name="search" value="{{ request('search') }}">
                    <button class="btn btn-danger" type="submit" >Search</button>
                </div>
            </form>
        </div>
    </div>
    @if ($posts->count())
        <div class="card mb-3">
            @if ($posts[0]->image)
            <div style="max-height:400px; overflow:hidden">
                <img src="{{ asset('storage/' .$posts[0]->image) }}" class="card-img-top mb-3" alt="">
            </div>
            @else
            <img src="https://source.unsplash.com/1200x400?{{ $posts[0]->category->name }}" class="card-img-top"
                alt="...">
            @endif

            <div class="card-body text-center">
                <h5 class="card-title"><a href="/posts/{{ $posts[0]->slug }}"
                        class="text-decoration-none">{{ $posts[0]->title }}</a> </h5>
                <p><small>by : <a href="/blog?author={{ $posts[0]->author->username }}"
                            class="text-decoration-none">{{ $posts[0]->author->name }}</a> in <a
                            href="/blog?category={{ $posts[0]->category->slug }}"
                            class="text-decoration-none">{{ $posts[0]->category->name }}</a>
                        {{ $posts[0]->created_at->diffForHumans() }}
                    </small></p>
                <p class="card-text">{{ $posts[0]->excerpt }}</p>
                <a href="/posts/{{ $posts[0]->slug }}" class="text-decoration-none btn btn-primary">Read more...</a>
            </div>
        </div>

        {{-- card kecil --}}
        <div class="container">
            <div class="row">
                @foreach ($posts->skip(1) as $post)
                    <div class="col-md-4 mb-3">
                        <div class="card" style="width: 18rem;">
                            <p class="position-absolute px-3 py-2 " style="background-color: rgba(0, 0, 0, 0.7)">
                                <a href="/blog?category={{ $post->category->slug }}"
                                    class="text-white text-decoration-none">{{ $post->category->name }}</a>
                            </p>
                            @if ($post->image)
                                <img src="{{ asset('storage/'. $post->image) }}" class="card-img-top" alt="">
                            @else
                            <img src="https://source.unsplash.com/500x400?{{ $post->category->name }}" class="card-img-top"
                                alt="...">
                            @endif
                            <div class="card-body">
                                <h5 class="card-title">{{ $post->title }}</h5>
                                <p><small>by : <a href="/blog?author={{ $post->author->username }}"
                                            class="text-decoration-none">{{ $post->author->name }}</a></a>
                                        {{ $post->created_at->diffForHumans() }}
                                    </small></p>
                                <p class="card-text">{{ $post->excerpt }}</p>
                                <a href="/posts/{{ $post->slug }}" class="btn btn-primary">Read more</a>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    @else
        <p class="text-center fs-4">Posts Not Found</p>
    @endif

    {{-- pagination --}}
    <div class="d-flex justify-content-center">
        {{ $posts->links() }}
    </div>
@endsection
