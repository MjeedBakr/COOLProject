(* to run the program:
    1- Go to the folder path in the Command Line
    2- Write "docker compose run cool"
    3- Write " coolc FILENAME.cl " to compile
    4- Write " spim FILENAME.s " to run   *)
    
class Shape {

    io : IO <- new IO;    -- Input Output Object for the whole program
 
    printArea(): Object { {0;} };
    calculateArea(): Int { {0;} };
 };
 
 class Circle inherits Shape
 {
 
    radius : Int;
 
    calculateArea(): Int --Calculate Circle Area
    {
       {
          (radius * radius) * 3 ;
       }
    };
 
    printArea() : Object --Print Circle Area
    { 
       {
          io.out_string("Area of circle: ");
          io.out_int(calculateArea());
          io.out_string("\n");
          self;
       }
    };
 
    readRadius() : Object --Read Circle radius from user
    { 
       {
          io.out_string("Circle - Radius: ");
          init(io.in_int());
       }
    };
 
    init(rad : Int) : Circle --constructor to assign the value 
    { 
       {
          radius <- rad;
          self;
       }
    };
 
 };
 
 class Rectangle inherits Shape
 {
 
    width : Int;
    height : Int;
 
    calculateArea(): Int --Calculate Rectangle Area
    {
       {
          width * height;
       }
    };
 
    printArea() : Object --Print Rectangle Area
    { 
       {
          io.out_string("Area of Rectangle: ");
          io.out_int(calculateArea());
          io.out_string("\n");
          self;
       }
    };
 
    readWidthAndHeight() : Object --Read Rectangle width and height from user
    { 
       {
          io.out_string("Rectangle - Width: ");
          width <- io.in_int();
          io.out_string("Rectangle - height: ");
          height <- io.in_int();
          init(width, height);
       }
    };
 
    init(wdh : Int, het : Int) : Rectangle --constructor to assign the value 
    { 
       {
          width <- wdh;
          height <- het;
          self;
       }
    };
 
 };
 
 class Triangle inherits Shape
 {
 
    base : Int;
    height : Int;
 
    calculateArea(): Int --Calculate Triangle Area
    {
       {
          (base * height) / 2;
       }
    };
 
    printArea() : Object --Print Triangle Area
    { 
       {
          io.out_string("Area of Triangle: ");
          io.out_int(calculateArea());
          io.out_string("\n");
          self;
       }
    };
 
    readBaseAndHeight() : Object --Read Triangle base and height from user
    { 
       {
          io.out_string("Triangle - base: ");
          base <- io.in_int();
          io.out_string("Triangle - height: ");
          height <- io.in_int();
          init(base, height);
       }
    };
 
    init(bse : Int, het : Int) : Triangle --constructor to assign the value 
    { 
       {
          base <- bse;
          height <- het;
          self;
       }
    };
 
 };
 
 class Main
 {
 
    c1 : Circle <- new Circle;
    r1 : Rectangle <- new Rectangle;
    t1 : Triangle <- new Triangle;
 
    main() : Object
    {
       {
          (new IO).out_string("\n\n");
 
          c1.readRadius();
          r1.readWidthAndHeight();
          t1.readBaseAndHeight();
 
          (new IO).out_string("\n");
 
          c1.printArea();
          r1.printArea();
          t1.printArea();
          
          (new IO).out_string("\n\n");         
       }
    };
 };