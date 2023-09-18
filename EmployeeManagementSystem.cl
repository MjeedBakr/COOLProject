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
    };--end method initEmployee()

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
    };

    setAge(a: Int): Object
    {
        age <- a
    };

    setSalary(s: Int): Object
    {
        salary <- s
    };

    setRetired(s: Bool): Object
    {
      isRetired <- s
    };

    getName(): String
    {
        name
    };

    getAge(): Int
    {
        age
    };

    getSalary(): Int
    {
        salary
    };

    getRetired(): Bool
    {
        isRetired
    };

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
    };

    setData(d: Employee) : Object
    {
            data <- d
    };

    setNext(n: Node) : Object
    {
            next <- n
    };

    getData() : Employee
    {
        data
    };

    getNext() : Node --returns the next node
    {
        next
    };

};--end class Node


-- Class List represents a linked list of employees
class List inherits Node 
{
    head: Node;   -- First node in the list
    nil: Node;    -- Null pointer
    pr: Node;     -- Used temporary for printing

    -- Constructor
    initList(h: Node): List
    {
        {
            self;
        }
    };

    addEmployee(n: Node): Object
    {
        {
            if (isvoid head) -- if the list is empty
            then 
            {
                head <- n;  -- Set the head to the new node
                head.setData(n.getData()); -- Set the attributes of the head
                n.setNext(nil); -- Set the next node attribute to Null
            }
            else
            {
               n.setNext(head); -- Set the next attribute of the new node to current head
               head <- n; -- Update the head to the new node
               head.setData(n.getData()); -- Set the data attribute of the head node
            }
            fi;
        }
    };-- end addaddEmployee() method


    -- Only for employee with a salary > 5000
    calculateBonus(): Object
    {
        {
            let e: Employee, -- Temp to hold employee information
            bonus: Int -- stores the calculated bonus
             in
            {
                pr <- head; -- starts from the first employee

                while
                    not(isvoid pr)
                loop
                {
                    e <- pr.getData(); -- stores the current employee information in e
                    if 5000 <= e.getSalary()
                    then 
                    {
                        out_string("\nBonus for ");
                        out_string(e.getName());
                        out_string(": ");

                        bonus <- e.getSalary() + ((e.getSalary() * 20) / 100);
                        out_int(bonus);

                        pr <- pr.getNext(); --move to the next employee node
                    }
                    else
                    {
                        pr <- pr.getNext(); --move to the next employee node
                    }
                    fi;
                } -- end loop
                pool;
                out_string("\n\n");
            };-- end let - in
        }
    };--end calculateBonus() method

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
                e <- pr.getData(); -- stores the current employee information in e
                if (e.getName() = name)
                then
                {
                    e <- pr.getData(); -- stores the current employee information in e
                    if (whatToEdit = 1)
                    then
                    {

                        e.setName(modifyName);
                        out_string("The new name is: ");
                        out_string(e.getName());
                        pr <- pr.getNext(); --move to the next employee node
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
                        pr <- pr.getNext(); --move to the next employee node
                    }
                    else
                    {
                        e.setSalary(modifyAgeOrSalary);
                        out_string("The new Salary is: ");
                        out_int(e.getSalary());
                        pr <- pr.getNext(); --move to the next employee node
                    } --end inner if-then-else
                    fi fi;
                } -- end outer if-then
                else
                {
                    pr <- pr.getNext(); --move to the next employee node
                } -- end outed else
                fi;
            } -- end loop
            pool;
            out_string("\n");
            self;
        }-- end let - in
    };--end editEmployee() method

    printRetired() : Object
    {
        let e: Employee
        in
        {
            pr <- head; -- starts from the first employe
            out_string("Retired Employees: \n");
            while not(isvoid pr)
            loop
            {
                e <- pr.getData(); -- stores the current employee information in e
                if (e.getRetired())
                then
                {
                    out_string(e.getName().concat("\n"));
                    pr <- pr.getNext(); --move to the next employee node
                }
                else
                {
                    pr <- pr.getNext(); --move to the next employee node
                }
                fi;
            }
            pool;
            out_string("\n");
            self;
        }
    };--end printRetired method

};--end List class


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
                -- Initialize the employee list with an empty node
                employeesList <- (new List).initList((new Node).initNode((new Employee), nil));
                
                while (true)
                loop
                {
                    out_string("Choose an option:\n1. Add Employee\n2. Edit Employee\n3. Display retired Employees\n4. Calculate Bonus\n5. Exit\n");
                    choice <- in_int();

                    if (choice = 1)
                    then
                    {
                        --add new employee to the list
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
                        -- edit employee information
                        out_string("Enter the name of the employee to edit: ");
                        name <- in_string();
                        out_string("Enter a number to edit\n(1) name\n(2) age\n(3) salary \n");
                        let tempChoice : Int
                        in
                        {
                            -- temp choice to select what to edit
                            tempChoice <- in_int();
                            out_string("Enter the new value: ");
                            if (tempChoice = 1)
                            then
                            {
                                -- edit the employee name
                                modifyName <- in_string();
                                employeesList.editEmployee(name, tempChoice, 1, modifyName);
                            }
                            else
                            {
                                -- edit the employee age or salary
                                modifyAgeOrSalary <- in_int();
                                employeesList.editEmployee(name, tempChoice, modifyAgeOrSalary, "");
                            }
                            fi;
                        };-- end of the inner let - in
                    }
                    else if (choice = 3)
                    then
                    {
                        -- display retired employees
                        employeesList.printRetired();
                    }
                    else if (choice = 4)
                    then
                    {
                        -- calculate bonus
                        employeesList.calculateBonus();
                    }
                    else
                    {
                        -- exit the program
                        out_string("Exiting......");
                        abort();
                    } 
                    fi fi fi fi; --end if statements for menu options
                
                } -- end of the loop
                pool; 
            
            }; -- end let - in
        
        } -- end main method block statements
    
    }; --end main method

}; -- end main class