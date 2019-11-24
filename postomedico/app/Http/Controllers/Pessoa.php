<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class Pessoa extends Controller
{
    public function getListPessoas(){
        $listcate = Pessoa::all(); //cách khác chọn 1 vài column Category::select('CategoryId','CategoryName','Description')->orderBy('CategoryId','ASC')->get();
        #return view('admin.pages.cate.listcate', compact('listcate'));
    }
}
