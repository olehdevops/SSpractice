class Department():
    team = []
    

class Employee(object):
    def __init__(self, fst_name, lst_name, exp, salary, manager = None, dept=None):
        self.fst_name = fst_name
        self.lst_name = lst_name
        self.exp = exp
        self.salary = salary
        self.manager = manager
        self.dept = dept
        self.employees = []
        self.add_employees()

    def add_employees(self):
        if self.manager:
            self.manager.employees.append(self)

    def update_salary(self) :
        if 5 > self.exp >= 2 :
            self.salary += 300
            print("Salary with bonus is : " + str(self.salary) + "$")
        elif self.exp >= 5 :
            self.salary = (self.salary*1.2) + 500
            print("Salary with bonus is : " + str(self.salary) + "$")
        else:
            print("Salary is : " + str(self.salary) + "$")

class Manager(Employee):
    def __init__(self, fst_name, lst_name, exp, salary, manager = None, dept=None):
        Employee.__init__(self, fst_name, lst_name, exp, salary, manager, dept)
        Department.team.append(self)

    def count_salary(self):
        qty = len(self.employees)
        sal = self.salary*qty
        return sal

class Developer(Employee):
    def __init__(self, fst_name, lst_name, exp, salary, manager = None, dept=None):
        Employee.__init__(self, fst_name, lst_name, exp, salary, manager, dept)
        self.manager = manager

class Designer(Employee):
    def __init__(self, fst_name, lst_name, exp, salary, manager = None, dept=None):
        Employee.__init__(self, fst_name, lst_name, exp, salary, manager, dept)
        self.manager = manager

    



man1 = Manager('Serhio', 'Pervio', 8, 6000)
man2 = Manager('Huliyo', 'Vtorio', 4, 3500)
man3 = Manager('Vdulio', 'Tresio', 2, 1500)
man4 = Manager('Anuego', 'Forrio', 5, 4700)
man5 = Manager('Nahiba', 'Fiviyo', 1, 1000)

print(man1.update_salary())
print(man2.update_salary())
print(man3.update_salary())
print(man4.update_salary())
print(man5.update_salary())

dev1 = Developer('Uno', 'Amigo', 3, 2000, manager=man1)
dev2 = Developer('Dos', 'Conmigo', 1, 800, manager=man2)
dev3 = Developer('Tres', 'Pomigo', 4, 2200, manager=man2)
dev4 = Developer('Cuatro', 'Domigo', 7, 4500, manager=man3)
dev5 = Developer('Cinco', 'Lomigo', 1, 900, manager=man4)
dev6 = Developer('Seis', 'Vomigo', 5, 3000, manager=man4)
dev7 = Developer('Siete', 'Komigo', 10, 7000, manager=man4)
dev8 = Developer('Ocho', 'Romigo', 3, 2100, manager=man5)
dev9 = Developer('Nueve', 'Tomigo', 3, 2500, manager=man1)
