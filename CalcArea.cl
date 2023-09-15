(* to run the program:
    1- Go to the folder path in the Command Line
    2- Write "docker compose run cool"
    3- Write " coolc FILENAME.cl " to compile
    4- Write " spim FILENAME.s " to run   *)
    
class Shape inherits IO{
 
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
          out_string("Area of circle: ");
          out_int(calculateArea());
          out_string("\n");
          self;
       }
    };
 
    readRadius() : Object --Read Circle radius from user
    { 
       {
          out_string("Circle - Radius: ");
          init(in_int());
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
          out_string("Area of Rectangle: ");
          out_int(calculateArea());
          out_string("\n");
          self;
       }
    };
 
    readWidthAndHeight() : Object --Read Rectangle width and height from user
    { 
       {
          out_string("Rectangle - Width: ");
          width <- in_int();
          out_string("Rectangle - height: ");
          height <- in_int();
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
          out_string("Area of Triangle: ");
          out_int(calculateArea());
          out_string("\n");
          self;
       }
    };
 
    readBaseAndHeight() : Object --Read Triangle base and height from user
    { 
       {
          out_string("Triangle - base: ");
          base <- in_int();
          out_string("Triangle - height: ");
          height <- in_int();
          init(base, height);
       }
    };
 
    init(bse : Int, het : Int) : Triangle --constructor to assign the values
    { 
       {
          base <- bse;
          height <- het;
          self;
       }
    };
 
 };
 
 class Main inherits IO
 {
 
    c1 : Circle <- new Circle;
    r1 : Rectangle <- new Rectangle;
    t1 : Triangle <- new Triangle;
 
    main() : Object
    {
       {
          out_string("\n\n");
 
          c1.readRadius();
          r1.readWidthAndHeight();
          t1.readBaseAndHeight();
 
          out_string("\n");
 
          c1.printArea();
          r1.printArea();
          t1.printArea();
          
          out_string("\n\n");         
       }
    };

 };
