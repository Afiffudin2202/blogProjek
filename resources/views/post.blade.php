@extends('layouts.main')
@section('container')
    <div class="container">
        <div class="row justify-content-center mb-3">
            <div class="col-md-8">
                <h1 class="mb-3">{{ $post->title }}</h1>
                <p>by : <a href="/blog?author={{ $post->author->username }}"
                        class="text-decoration-none">{{ $post->author->name }}</a> in <a
                        href="/blog?category={{ $post->category->slug }}"
                        class="text-decoration-none">{{ $post->category->name }}</a></p>

                @if ($post->image)
                    <div style="max-height:400px; overflow:hidden">
                        <img src="{{ asset('storage/' . $post->image) }}" alt="" class="img-fluid mt-3">
                    </div>
                @else
                    <img src="https://source.unsplash.com/1000x400?{{ $post->category->name }}" alt=""
                        class="img-fluid mt-3">
                @endif

                <article class="mt-3">
                    {!! $post->body !!}
                </article>

                <a href="/blog" class="text-decoration-none d-block mt-3">Back to post</a>
            </div>
        </div>
    </div>
@endsection
