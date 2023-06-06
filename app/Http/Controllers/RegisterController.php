<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class RegisterController extends Controller
{
    public function index(){
        return view('register.index', [
            'title' => ' register',
            'active' => 'register'
        ]);
    }

    public function store(Request $request){
        $validateData = $request->validate([
            'name' => 'required |min:3| max:255',
            'username' => 'required | min:3 | max:255 | unique:users',
            'email' => 'required | email:dns | unique:users',
            'password' => 'required|min:6|max:255'
        ]);

        $validateData['password'] = Hash::make($validateData['password']);
        
        User::create($validateData);
        
        // pesan sukses
        // $request->session()->flash('success', 'Register Succesfully, Please Login');

        return redirect('/login')->with('success', 'Register Succesfully, Please Login');
    }
}