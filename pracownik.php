<?php
class Employee{
    public $name;
    protected $salary;

    public function __construct($name,$salary){
        $this->name = $name;
        $this->salary = $salary;
    }
    public function showinfo($name,$salary){
        return $name;
        return $salary;
        }
}
class Manager extends Employee{
    public $department;
    public function __construct($name,$salary,$department){ 
        $this->department = $department;
        return parent::__construct($name,$salary);
    }

    public function showinfo($name,$salary,$department){
        $this->department - $this->name
    }

}
$manager = new Manager("Jane", 8000, "IT");
echo $manager->showinfo()