class Number {

   reminder : Int;
   io : IO <- new IO;

   findReminder(number : Int) : Int
   {
      {
         let quoltient : Int <- number / 2 in
         reminder <- number - (quoltient * 2);
      }
   };

   printAllNumbers(start: Int, end : Int) : Object
   {
      {
         while (start < end + 1)
         loop 
         {
         io.out_int(start);
         io.out_string("\n\n");
         start <- start + 2;
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

   main() : Object
   {
     {

      io.out_string("Input: ");
      inputNumber <- io.in_int();

      io.out_string("\nOutput: \n\n" );

      let reminder : Int <- num1.findReminder(inputNumber) in --compute the reminder
      if (reminder = 0)
      then num1.printAllNumbers(2, inputNumber) --if the reminder is even
      else num1.printAllNumbers(1, inputNumber) -- if the reminder is odd
      fi;

     }
   };

};