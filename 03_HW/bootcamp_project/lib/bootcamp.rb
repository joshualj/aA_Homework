class Bootcamp
    def initialize(name, slogan, student_capacity) #, teachers, students, grades)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new {|k, v| k[v]=[]}
    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(teacher)
        @teachers << teacher
    end

    def enroll(student)
        if @students.count < @student_capacity
            @students << student
            return true
        end
        return false
    end

    def enrolled?(student)
        return @students.include?(student)
    end

    def student_to_teacher_ratio
        return @students.count / @teachers.count
    end

    def add_grade(str, grade)
        if @students.include?(str)
            @grades[str] << grade
            return true
        else
            return false
        end
    end

    def num_grades(str)
        return @grades[str].length
    end

    def average_grade(str)
        return nil if @grades.length == 0 || !students.include?(str)
        return @grades[str].sum / @grades[str].length
    end
end
