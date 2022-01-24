require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        return @salaries.has_key?(title)
    end

    def >(new_startup)
        return self.funding > new_startup.funding
    end

    def hire(employee_name, title)
        @employees << Employee.new(employee_name, title) if valid_title?(title)
        raise "this is an exception" if !valid_title?(title)
    end

    def size
        return @employees.length
    end

    def pay_employee(emp_inst)
        emp_salary = @salaries[emp_inst.title]
        if emp_salary <= @funding
            emp_inst.pay(emp_salary)
            @funding -= emp_salary
        else
            raise "not enough funds to pay employee"
        end
    end

    def payday
        @employees.each {|employee| pay_employee(employee)}
    end

    def average_salary
        sum = 0
        @employees.each {|employee| sum += @salaries[employee.title] }
        return (sum * 1.0) / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(start_up)
        @funding += start_up.funding
        start_up.salaries.each {|title, salary| @salaries[title] = salary if !@salaries.has_key?(title)}
        start_up.employees.each {|employee| @employees << employee}
        start_up.close
    end
end
