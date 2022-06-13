(deftemplate department   تعريفvariable        
(slot dept-name1)
(slot dept-name2)
(slot dept-name3))

(deffacts depts(department(dept-name1 CS)(dept-name2 IT) (dept-name3 IS)))      طريقة تعريف ال facts

(defrule DisplayDepts(department(dept-name1  ?name1) (dept-name2 ?name2) (dept-name3 ?name3)) => (printout t ?name1 " " ?name2 " " ?name3 " Departments are opened to register in now" crlf)))
         طريقة تعريف ال ruls
(run)   
(reset)  لحفظ الاوامر اللي اتعملت قبلها 
(run)    تشغيل ما تم كتابته   


(deftemplate departmentCourses       تعريفvariable 
(slot department-name)
(slot course-name)
(slot course-code)
(slot course-hours)
(slot course-prerequsties))


(deffacts courses
(departmentCourses(department-name CS)(course-name "Selected Artificial Intelligence")(course-code CS321)(course-hours 3)(course-prerequsties "Computer programming-2"))
(departmentCourses(department-name CS)(course-name "Selected Operating System-2")(course-code CS362)(course-hours 3)(course-prerequsties "Operating System-1"))
(departmentCourses(department-name CS)(course-name "Selected Computer Security")(course-code CS415)(course-hours 3)(course-prerequsties "Computer Networks-1"))
(departmentCourses(department-name CS)(course-name "Selected Software Engineering-1")(course-code CS251)(course-hours 3)(course-prerequsties "Computer programming-2"))
(departmentCourses(department-name CS)(course-name "Selected Computer Programming-3")(course-code CS334)(course-hours 3)(course-prerequsties "Computer Programming-2"))
(departmentCourses(department-name CS)(course-name "Selected Internet Computing")(course-code CS341)(course-hours 3)(course-prerequsties "Computer Programming-2"))

(departmentCourses(department-name IT)(course-name "Selected Computer Networks-2")(course-code IT312)(course-hours 3)(course-prerequsties "Computer Networks-1"))
(departmentCourses(department-name IT)(course-name "Selected Computer Graphics-1")(course-code IT341)(course-hours 3)(course-prerequsties "Mathematics-2"))
(departmentCourses(department-name IT)(course-name "Selected Image Processing-1")(course-code IT321)(course-hours 3)(course-prerequsties "Digital Signal Processing"))
(departmentCourses(department-name IT)(course-name "Selected Computer Vision-1")(course-code IT422)(course-hours 3)(course-prerequsties "Pattern Recognition-1"))
(departmentCourses(department-name IT)(course-name "Selected Speech Recognition-1")(course-code IT472)(course-hours 3)(course-prerequsties "Digital Signal Processing"))
(departmentCourses(department-name IT)(course-name "Selected Advanced Web Development")(course-code IT451)(course-hours 3)(course-prerequsties "Web Design and
Development"))

(departmentCourses(department-name IS)(course-name "Selected Database Systems-2")(course-code IS322)(course-hours 3)(course-prerequsties "Database Systems-1"))
(departmentCourses(department-name IS)(course-name "Selected Systems Analysis and Design-2")(course-code IS312)(course-hours 3)(course-prerequsties "Systems Analysis and Design-1"))
(departmentCourses(department-name IS)(course-name "Selected Information Retrieval")(course-code IS355)(course-hours 3)(course-prerequsties "Database Systems-1"))
(departmentCourses(department-name IS)(course-name "Selected Cloud Computing")(course-code IS435)(course-hours 3)(course-prerequsties "Operating System-1"))
(departmentCourses(department-name IS)(course-name "Selected Enterprise Architecture")(course-code IS449)(course-hours 3)(course-prerequsties "Introduction to IS"))
(departmentCourses(department-name IS)(course-name "Selected Information Security")(course-code IS426)(course-hours 3)(course-prerequsties "Mathematics-2"))
)

(reset)
(facts) لعرض كل ال facts اللي عملتها 



(defrule courseInfo(departmentCourses
(department-name ?dname)
(course-name ?cname)
(course-code ?ccode)
(course-hours ?chours)
(course-prerequsties ?cprerequsties))
 =>
        (printout t ?dname  " Departement include courses such as course-name : " ?cname " , course-code : " ?ccode
" , course-hours : " ?chours  " , prerequsties : " ?cprerequsties
  crlf crlf))

(run)


(save "kbs.clp")



(defrule reading-input
   =>
   (printout t "Enter DEPT name : " )
   (assert (department-name (read)))
   (printout t "Enter Name of the course : " )
   (assert (course-name (read))))


 (defrule checking-input
   (course-name ?course-name)
   (departmentCourses (course-name ?course-name1) (course-code ?course-code1) (course-hours ?course-hours1) (course-prerequsties ?course-prerequsties1))
   (test (eq ?course-name ?course-name1))
    =>
   (printout t "course code is : " ?course-code1  "and the course-hours is " course-hours1 " and the course-prerequsties is : " ?course-prerequsties1
 crlf))


(reset)
(run)




(defrule Prerequsties
   =>
   (printout t "Enter the Course Prerequsties you have: " )
   (assert (course-prerequsties (read))))


(deftemplate CoursesRegistered
   (slot coursename))

(deftemplate Prerequsties
   (slot course-prerequsties))

(defrule checking-prerequsties
   (course-prerequsties ?course-prerequsties)
   (departmentCourses (course-prerequsties ?course-prerequsties1) (course-name ?course-name1))
   (test (eq ?course-prerequsties ?course-prerequsties1))
    =>
   (printout t "course name : " ?course-name1 "is registered for you now." crlf crlf crlf))

(deftemplate RegisteredCode
   (slot CourseCode))

 (defrule checking-code
   (CourseCode ?CourseCode)
   (departmentCourses (course-code ?course-code1) (course-name ?course-name1))
   (test (eq ?CourseCode ?course-code1))
    =>
   (printout t "course name : " ?course-name1 " that have code " ?course-code1 " is registered for you now." crlf crlf crlf))

(defrule checking-d
   (CourseCode ?CourseCode)
   (departmentCourses (course-code ?course-code1) (course-name ?course-name1))
   (test (eq ?CourseCode ?course-code1))
    =>
   (printout t "course name : " ?course-name1 " that have code " ?course-code1 " is registered for you now." crlf crlf crlf))






(deftemplate DeptNameInput
   (slot department-name-input))

(defrule ReadDeptName
   =>
   (printout t "Enter the Dept Name you have: " )
   (assert (department-name-input (read))))


(defrule checking-dept-input
   (department-name-input ?department-name-input)
   (departmentCourses (course-name ?course-name1) (department-name ?department-name1))
   (test (eq ?department-name-input ?department-name1))
    =>
   (printout t " course name : " ?course-name1 crlf crlf crlf))




(reset)
(run)




