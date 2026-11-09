<?php
class Book{
    public $title;
    public $author;

    public function __construct($title,$author){
        $this->title = $title;
        $this->author = $author;
    }
    public function showinfo(){
        return $title;
        }
}
class Ebook extends Book{
    public $fileSize;
    public function __construct($title,$author,$fileSize){ 
        $this->fileSize = $fileSize;
        return parent::__construct($title,$author);
    }
    public function showinfo(){
        return"$this->fileSize - $this->title - $this->author";
    }
}
$ebook = new Ebook("200mb","JJK","gege");
echo $ebook->showinfo();