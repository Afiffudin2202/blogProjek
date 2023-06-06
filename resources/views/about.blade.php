@extends('layouts.main')
@section('container')
    <h1>Data diri</h1>
    <p>{{ $name }}</p>
    <p>{{ $jurusan }}</p>
    <img src="img/{{ $image }}" alt="{{ $name }}">
@endsection
