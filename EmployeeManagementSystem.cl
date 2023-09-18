class Employee inherits IO
{
    name : String;
    age : Int;
    salary : Int;
    isRetired : Bool;

    initEmployee(n: String, a: Int, s: Int) : Employee
    {
        {
            name <- n;
            age <- a;
            salary <- s;
            isRetired <- (60 < age);
            self;
        }
    };--end init

    displayRetiredEmployees() : Object
    {
        {
            out_string("Retired Employees: \n");
            if (isRetired)
            then
            {
                out_string("Name: ");
                out_string(name);
            }
            else out_string("\n") fi;
        }
    }; --end method displayRetiredEmployees()

    setName(n: String): Object
    {
        name <- n
    };--end setName

    setAge(a: Int): Object
    {
        age <- a
    };--end setAge

    setSalary(s: Int): Object
    {
        salary <- s
    };--end setSalary

    setRetired(s: Bool): Object
    {
      isRetired <- s
    };

    getName(): String
    {
        name
    };--end getName

    getAge(): Int
    {
        age
    };--end getAge

    getSalary(): Int
    {
        salary
    };--end getSalary

    getRetired(): Bool
    {
        isRetired
    };--end getRetired

}; --end class Employee

--class Node represents a node in a linked list
class Node inherits IO
{
    data: Employee; --store employee information
    next : Node; --points to the next node

    --constructor
    initNode(d: Employee, n: Node): Node
    {
        {
            data <- d;
            next <- n;
            self;
        }
    };-- end init

    setData(d: Employee) : Object
    {
            data <- d
    };--end setData method

    setNext(n: Node) : Object
    {
            next <- n
    };--end setNext method

    getData() : Employee
    {
        data
    };--end getData method

    getNext() : Node
    {
        next
    };

};--end class Node

--class List represents a linked list of employees
class List inherits Node 
{
    head: Node;--first node in the list
    nil: Node;--null pointer
    pr: Node;--for printing

    --constructor
    initList(h: Node): List
    {
        {
            self;
        }
    };

    addEmployee(n: Node): Object
    {
        {
            if (isvoid head) --if the is empty
            then 
            {
                head <- n;
                head.setData(n.getData());
                n.setNext(nil);
            }
            else
            {
               n.setNext(head);
               head <- n;
               head.setData(n.getData());
            }
            fi;
        }
    };-- end add method

    counter: Int;
    calculateBonus(): Object
    {
        {
            let e: Employee,
            bonus: Int
             in
            {
                counter <- 0;
                pr <- head;

                while
                    not(isvoid pr)
                loop
                {
                    e <- pr.getData();
                    if 5000 <= e.getSalary()
                    then 
                    {
                        out_string("\nBonus for ");
                        out_string(e.getName());
                        out_string(": ");

                        bonus <- e.getSalary() + ((e.getSalary() * 20) / 100);
                        out_int(bonus);

                        pr <- pr.getNext();
                        counter <- counter + 1;
                    }
                    else
                    {
                        counter <- counter + 1;
                        pr <- pr.getNext();
                    }
                    fi;
                }
                pool;
                out_string("\n\n");
            };
        }
    };--end calculateBonus method

    editEmployee(name: String, whatToEdit: Int, modifyAgeOrSalary: Int, modifyName: String) : Object
    {
        let index: Int,
        e: Employee --temp for edited employee information
        in
        {
            pr <- head; --start from first employee

            while not(isvoid pr)
            loop
            {
                e <- pr.getData();
                if (e.getName() = name)
                then
                {
                    e <- pr.getData();
                    if (whatToEdit = 1)
                    then
                    {

                        e.setName(modifyName);
                        out_string("The new name is: ");
                        out_string(e.getName());
                        pr <- pr.getNext();
                    } else if (whatToEdit = 2)
                    then
                    {

                        e.setAge(modifyAgeOrSalary);
                        out_string("The new age is: ");
                        out_int(e.getAge());
                        if (60 < modifyAgeOrSalary)
                        then 
                        {
                           e.setRetired(true);
                        }
                        else
                           e.setRetired(false)
                        fi;
                        pr <- pr.getNext();
                    }
                    else
                    {
                        e.setSalary(modifyAgeOrSalary);
                        out_string("The new Salary is: ");
                        out_int(e.getSalary());
                        pr <- pr.getNext();
                    }
                    fi fi;
                }
                else
                {
                    pr <- pr.getNext();
                }
                fi;
            } 
            pool;
            out_string("\n");
            self;
        }
    };--end editEmployee method

    printRetired() : Object
    {
        let e: Employee
        in
        {
            pr <- head;
            out_string("Retired Employees: \n");
            while not(isvoid pr)
            loop
            {
                e <- pr.getData();
                if (e.getRetired())
                then
                {
                    out_string(e.getName().concat("\n"));
                    pr <- pr.getNext();
                }
                else
                {
                    pr <- pr.getNext();
                }
                fi;
            }
            pool;
            out_string("\n");
            self;
        }
    };--end printRetired method






};


class Main inherits IO
{
    main(): Object
    {
        {
            let employeesList: List,
            nil: Node,
            modifyName: String,
            modifyAgeOrSalary: Int,
            choice: Int,
            name: String,
            age: Int,
            salary: Int
            in 
            {
                employeesList <- (new List).initList((new Node).initNode((new Employee), nil));
                while (true)
                loop
                {
                    out_string("Choose an option:\n1. Add Employee\n2. Edit Employee\n3. Display retired Employees\n4. Calculate Bonus\n5. Exit\n");
                    choice <- in_int();

                    if (choice = 1)
                    then
                    {
                        out_string("\nEnter employee name: ");
                        name <- in_string();
                        out_string("\nEnter employee age: ");
                        age <- in_int();
                        out_string("\nEnter employee salary: ");
                        salary <- in_int();
                        employeesList.addEmployee( (new Node).initNode((new Employee).initEmployee(name, age, salary),nil));
                    }
                    else if (choice = 2)
                    then
                    {
                        out_string("Enter the name of the employee to edit: ");
                        name <- in_string();
                        out_string("Enter a number to edit\n(1) name\n(2) age\n(3) salary \n");
                        let tempChoice : Int
                        in
                        {
                            tempChoice <- in_int();
                            out_string("Enter the new value: ");
                            if (tempChoice = 1)
                            then
                            {
                                modifyName <- in_string();
                                employeesList.editEmployee(name, tempChoice, 1, modifyName);
                            }
                            else
                            {
                                modifyAgeOrSalary <- in_int();
                                employeesList.editEmployee(name, tempChoice, modifyAgeOrSalary, "");
                            }
                            fi;
                        };
                    }
                    else if (choice = 3)
                    then
                    {
                        employeesList.printRetired();
                    }
                    else if (choice = 4)
                    then
                    {
                        employeesList.calculateBonus();
                    }
                    else
                    {
                        abort();
                        0;
                    }
                    fi fi fi fi;
                }
                pool;
            };
        }
    
        
    };
};