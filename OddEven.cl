class Number {

    quoltient : Int;
    reminder : Int;
    io : IO <- new IO;
    evenCounter : Int <- 2;
    oddCounter : Int <- 1; 
 
 
    findReminder(number : Int) : Int
    {
       {
          quoltient <- number / 2;
          reminder <- number - (quoltient * 2);
       }
    };
 
    printAllEvenNumbers(number : Int) : Object
    {
       {
          while (evenCounter < number + 1)
          loop 
          {
          io.out_int(evenCounter);
          io.out_string("\n\n");
          evenCounter <- evenCounter + 2;
          }
          pool;
       }
    };
 
    printAllOddNumbers(number : Int) : Object
    {
       {
          while (oddCounter < number + 1)
          loop 
          {
          io.out_int(oddCounter);
          io.out_string("\n\n");
          oddCounter <- oddCounter + 2;
          }
          pool;
       }
    };
 };
 
 
 class Main
 {
    num1 : Number <- new Number;
    io : IO <- new IO; --for Input & Output operations
    inputNumber : Int; --stores the input Number
    reminder : Int; --stores the Reminder of the input Number
 
    main() : Object
    {
      {
       io.out_string("Input: ");
       inputNumber <- io.in_int();
 
       io.out_string("\nOutput: \n\n" );
       reminder <- num1.findReminder(inputNumber);
 
       if (reminder = 0)
       then num1.printAllEvenNumbers(inputNumber) --if the reminder is even
       else num1.printAllOddNumbers(inputNumber) -- if the reminder is odd
       fi;
      }
    };
 
 };