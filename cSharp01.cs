using system;
using system.Collections.Generic;
using system.Linq;
using system.Text;

namespace assign01
{
    class Program
    {
        static void Main(string[] args)
        {
            /* 1.
            telephone number: string
            height: float
            age: short
            gender: char, string
            salary: decimal
            ISBN: string
            book price: decimal
            book shipping weight: float
            country population: int
            num stars in universe: long
            number of employees in uk: int

            2.
            value type: int, float, char, string, decimal
            reference type: class, struct, array, list, dictionary, stack, queue, etc.
            value type holds a value, reference type holds a reference to a value
            
            boxing: converting a value type to a reference type
            unboxing: converting a reference type to a value type

            3.
            managed resources vs unmanaged resources
            managed resources: resources that are created and destroyed by the .NET Framework
            unmanaged resources: resources that are created and destroyed by the application

            4.
            purpose of garbage collector:
            - reclaims memory that is no longer in use

            */

            // 5. Ask user for name, age, favorite color, and animal
            console.writeline("What is your name?");
            string name = console.readline();
            console.writeline("What is your age?");
            short age = short.parse(console.readline());
            console.writeline("What is your favorite color?");
            string color = console.readline();
            console.writeline("What is your favorite animal?");
            string animal = console.readline();

            console.writeline("Your name is " + name);
            console.writeline("Your age is " + age);
            console.writeline("Your favorite color is " + color);
            console.writeline("Your favorite animal is " + animal);

            /*
            number of bytes in;
            sbyte: 1
            byte: 1
            short: 2
            ushort: 2
            int: 4
            uint: 4
            long: 8
            ulong: 8
            float: 4
            double: 8
            decimal: 16
            */

            // program that takes input number of centuries and prints the number of years, days, hours, minutes, seconds, and milliseconds
            Console.WriteLine("How many centuries?");
            int centuries = int.Parse(Console.ReadLine());
            int years = centuries * 100;
            int days = (int)(years * 365.25);
            int hours = (int)(days * 24);
            int minutes = (int)(hours * 60);
            int seconds = (int)(minutes * 60);
            int milliseconds = (int)(seconds * 1000);
            Console.WriteLine("Years: " + years);
            Console.WriteLine("Days: " + days);
            Console.WriteLine("Hours: " + hours);
            Console.WriteLine("Minutes: " + minutes);
            Console.WriteLine("Seconds: " + seconds);
            Console.WriteLine("Milliseconds: " + milliseconds);

            /*
            -------control flow and converting types-------
            
            What happens when you divide int by 0?
                You get an exception - divide by zero
            What happens when you divide double by 0?
                You get an exception - divide by zero
            What happens when you overflow an int?
                You get an exception - overflow
            Difference between x = y++; and x = ++y;?
                x = y++; increments y before assigning it to x
                x = ++y; increments y after assigning it to x

             difference between break, continue, and return when used inside a loop statement
                break: breaks out of the loop
                continue: continues to the next iteration of the loop
                return: returns from the method
            */

        }
    }
}
