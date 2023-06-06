<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\Category;
use Illuminate\Http\Request;
use \Cviebrock\EloquentSluggable\Services\SlugService;
use Illuminate\Support\Str;
use App\Http\Requests\StoreDashboardPostRequest;
use Illuminate\Support\Facades\Storage;

class DashboardPostController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('dashboard.posts.index',[
            'posts' =>Post::where('user_id', auth()->user()->id)->get()
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('dashboard.posts.create', [
            'categories' => Category::all()
        ]);
    }
    
    public function store(Request $request)
    {

        // return $request->file('image')->store('file-images'); -> untuk cek inputan image
    //    untuk memvalidasi data yan di input user
      $validatedData = $request->validate([
            'title' => 'required|max:255',
            'slug' => 'required|unique:posts',
            'category_id' => 'required',
            'image' => 'image|file|max:1024',
            'body' => 'required'
        ]);


        // apabila ada image yang di upload
        if ($request->file('image')) {
            $validatedData['image'] = $request->file('image')->store('file-images');
        }
        $validatedData['user_id'] = auth()->user()->id;
        $validatedData['excerpt'] = Str::limit(strip_tags($request->body), 100);


        Post::create($validatedData);

        return redirect('/dashboard/posts')->with('success', 'New post has been added');
    }

    /**
     * Display the specified resource.
     */
    public function show(Post $post)
    {
        return view('dashboard.posts.post', [
            'post' => $post
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Post $post)
    {
         return view('dashboard.posts.edit', [
            'post' => $post,
            'categories' => Category::all()
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Post $post)
    {
        // variable sebelum di validasi
         $rules = [
            'title' => 'required|max:255',
            'category_id' => 'required',
            'image' => 'image|file|max:1024',
            'body' => 'required'
        ];

        // untuk validasi slug apakah di edit atau tidak
        if ($request->slug != $post->slug) {
            $rules['slug'] = 'required|unique:posts';
        }
        

        // memvalidasi
        $validatedData = $request->validate($rules);

        // apabila ada image yang di upload
        if ($request->file('image')) {
            // untuk menghapus image lama di storage
            if ($request->oldImage) {
                Storage::delete($request->oldImage);
            }
            $validatedData['image'] = $request->file('image')->store('file-images');
        }

        $validatedData['user_id'] = auth()->user()->id;
        $validatedData['excerpt'] = Str::limit(strip_tags($request->body), 100);


        // query update data 
        Post::Where('id', $post->id)
            ->update($validatedData);

             return redirect('/dashboard/posts')->with('success', 'New post has been updated');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Post $post)
    {
        if ($post->image) {
                Storage::delete($post->image);
            }

        Post::destroy($post->id);

         return redirect('/dashboard/posts')->with('success', 'post has been delected');
    }

    // membuat slug otomatis
    public function checkSlug(Request $request){
        $slug = SlugService::createSlug(Post::class, 'slug', $request->title);
        return response()->json(['slug' => $slug]);
    }
}
