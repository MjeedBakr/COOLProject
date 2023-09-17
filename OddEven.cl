class Main inherits IO
{
   inputNumber : Int; --stores the input Number
   
   printAllNumbers(start: Int, end : Int) : Object
   {
      {
         while (start < end + 1)
         loop 
         {
         out_int(start);
         out_string("\n\n");
         start <- start + 2;
         }
         pool;
      }

   };

   main() : Object
   {

     {
      out_string("Input: ");  
      inputNumber <- in_int(); --Read a number from the user

      out_string("\nOutput: \n\n" );

      let reminder : Int <- 0 in  
      {
         let quoltient : Int <- inputNumber / 2 in  --compute the reminder
         reminder <- inputNumber - (quoltient * 2);

         if (reminder = 0)
         then printAllNumbers(2, inputNumber) --if the reminder is even (start from number 2, end with the input number)
         else printAllNumbers(1, inputNumber) -- if the reminder is odd (start from number 1, end with the input number)
         fi;
      }; 
     }
     
   };

};
