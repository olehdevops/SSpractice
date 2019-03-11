class Department():
    team = []
    def get_salary(self):
        for man in self.team:
            print(man.fst_name,man.lst_name,"#salary: ",man.count_salary())
            for empl in man.man_team:
                print("    ",empl.fst_name,empl.lst_name,", manager is - ",man.fst_name,man.lst_name,"#salary: ",empl.update_salary())
    

class Employee(object):
    def __init__(self, fst_name, lst_name, exp, salary, manager = None):
        self.fst_name = fst_name
        self.lst_name = lst_name
        self.exp = exp
        self.salary = salary
        self.manager = manager
        self.man_team = []
        self.add_employees()
    def add_employees(self):
        if self.manager:
            self.manager.man_team.append(self)
    def update_salary(self) :
        if 5 > self.exp >= 2 :
            self.salary += 300
        elif self.exp >= 5 :
            self.salary = (self.salary*1.2) + 500
        else:
            return self.salary  
    def team(self):
        if self.manager != None :
            Department.team.append()
    

class Manager(Employee):
    def __init__(self, fst_name, lst_name, exp, salary, manager = None):
        Employee.__init__(self, fst_name, lst_name, exp, salary, manager)
        Department.team.append(self)
    def count_salary(self):
        qty = len(self.man_team)
        salary = self.salary*qty
        return salary

class Developer(Employee):
    def __init__(self, fst_name, lst_name, exp, salary, manager = None):
        Employee.__init__(self, fst_name, lst_name, exp, salary, manager)
        self.manager = manager
    def update_salary(self) :
        if 5 > self.exp >= 2 :
            self.salary *= 1.2
        elif self.exp >= 5 :
            self.salary *=1.5
        return self.salary
    def team(self):
        if self.manager != None :
            Department.team.append()

class Designer(Employee):
    def __init__(self, fst_name, lst_name, exp, salary, manager=None, cof=None):
        Employee.__init__(self, fst_name, lst_name, exp, salary, manager)
        self.manager = manager
        self.cof = cof
    def update_salary(self) :
        self.salary += self.salary * self.cof  
        return self.salary  
    def team(self):
        if self.manager == Manager :
            Department.team.append()


man = Manager('Serhio', 'Pervio', 8, 6000)
man2 = Manager('Huliyo', 'Vtorio', 4, 3500)


dev1 = Developer('Uno', 'Amigo', 3, 2000, manager=man)
dev2 = Developer('Dos', 'Conmigo', 1, 800, manager=man)
dev3 = Developer('Tres', 'Pomigo', 4, 2200, manager=man2)
dev4 = Developer('Cuatro', 'Domigo', 7, 4500, manager=man)
dev5 = Developer('Cinco', 'Lomigo', 1, 900, manager=man2)
dev6 = Developer('Seis', 'Vomigo', 5, 3000, manager=man2)
dev7 = Developer('Siete', 'Komigo', 10, 7000, manager=man)
dev8 = Developer('Ocho', 'Romigo', 3, 2100, manager=man)
dev9 = Designer('Nueve', 'Tomigo', 3, 2500, manager=man, cof=0.5)

team = Department()
team.get_salary()