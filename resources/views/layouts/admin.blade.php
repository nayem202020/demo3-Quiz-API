<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ config('app.name', '10 Takar Foundation') }}| @yield('title') </title>
    <link href="{{ asset('css/admin.css') }}" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
    @yield('css')
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper" id="app">
    @include('layouts.admin.navbar')
    @include('layouts.admin.sidebar')
    <div class="content-wrapper">
        <section class="content">
            <admin></admin>
        </section>
    </div>
    @include('layouts.admin.footer')
</div>

<script src="{{ asset('js/admin.js') }}" defer></script>
@yield('js')
</body>
</html>

