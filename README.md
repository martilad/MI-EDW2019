# MI-EDW-2019

Semestral work for Enterprise Data Warehouse Systems at FIT CVUT.

## HW1

Data analysis, entity and DB model design.

### Data description
We've got data from an experiment which was carried with a group of 115
students of first-year, undergraduate Engineering major of the University 
of Genoa. It comes from a simulation environment named Deeds 
(Digital Electronics Education and Design Suite) which is used for e-learning in
digital electronics. The environment provides learning materials through
specialized browsers for the students, and asks them to solve various problems
with different levels of difficulty.

We've aquired five types of datasets:
1. [__Data__](#sessions-data) contains time series 
of activities during six sessions of laboratory sessions of the course of 
digital electronics. There are 6 folders containing the students’ data per 
session. Each 'Session' folder contains up to 99 CSV files each dedicated to a 
specific student log during that session. The number of files in each folder c
hanges due to the number of students present in each session. Each file contains
13 features described [below](#sessions-data).
2. [__Students__](#student-data) contains ids of individual students, their first and last name
and last_update which indicates the date of the last change to the entry.
3. [__Logs__](#log-data) contains attendance of students on sessions.
4. [__Intermidiate grades__](#session-grades) contains achieved points by each student for
each session except the first one.
5. [__Final grade__](#final-grades) contains achieved points by each student for each question
of the final exam.

From these datasets, we shell be able to extract dependencies between student
activity and performance and his final grade. It might also indicate the 
attractivity and complexity of individual sessions or even individual exercises.
To be able to extract and analyze these datasets and data they contain properly,
it is crucial to have the data warehouse designed and implemented optimaly for
the given bussiness domain.

#### Sessions data
* __session__ [int] - 
the number of a laboratory session from 1 to 6
* __student_id__ [int] - 
the Id of a student from 1 to 115
* __exercise__ [string] - 
the Id of the exercise the student is working on. Each session contains 4 to 6 exercises, shown as 'Es_# of the session_# of the exercise' (e.g. Es_1_2: exercise 2 of session 1).
'Es' with no number means the student has not started the exercise yet
* __activity__ [string] - 
the activities are labeled based on the title of web pages that are on focus / in the view of the student.
To ensure anonymity, we did not publish the exact name of visited pages by the students thus renamed and augmented the pages into 'activity' names.
To read about the details of activity labels, see 'activities_info.txt'.
* __start_time__ [date] - 
the start date and time of a specific activity with the format: dd.mm.yyyy hh:mm:ss
* __end_time__ [date] - 
the end date and time of a specific activity with the format: dd.mm.yyyy hh:mm:ss
* __idle_time__ [int] - 
the duration of idle time between the start and end time of an activity in milliseconds
* __mouse_wheel__ [int] - 
the amount of mouse wheel during an activity
* __mouse_wheel_click__ [int] - 
the number of mouse wheel clicks during an activity
* __mouse_click_left__ [int] - 
the number of mouse left clicks during an activity
* __mouse_click_right__ [int] - 
the number of mouse right clicks during an activity
* __mouse_movement__ [int] - 
the distance covered by the mouse movements during an activity
* __keystroke__ [int] - 
the number of keystrokes during an activity

##### Session data - activity types
* __Study\_Es\_# of session\_# of exercise__ -
indicates that a student is studying / viewing the content of a specific 
exercise (e.g. Study_Es_6_1)
* __Deeds\_Es\_# of session\_# of exercise__ -
indicates that the student is working on a specific exercise inside the Deeds
simulator (Digital Circuit Simulator) (e.g. Deeds_Es_6_1)
* __Deeds\_Es__ -
shows when the student is on Deeds simulator but it is not clear what exercise
he is working on
* __Deeds__ -
contains other activities related to Deeds, for instance when the students save
circuit image or export VHDL
* __TextEditor\_Es\_# of session\_# of exercise__ -
when the student is writing the results of his work to submit later to the
instructor. The students use a text editor (Word, Office, etc.) to answer to 
the questions and explain the solution they found through Deeds simulator
(e.g. TextEditor_Es_6_1)
* __TextEditor\_Es__ -
indicates that the student is working on an exercise in the text editor but it
is not clear which exercise it is. This happens due to change of file names by
the student, so we cannot recognize automatically which exercise he works on
* __TextEditor__ -
shows that the student is using the text editor but not on exercises, this can
contain other activities related to the text editor, for instance when they just
open it, etc.
* __Diagram__ -
when the students use 'Simulation Timing Diagram' to test the timing simulation
of the logic networks, while using the Deeds simulator. It also contains these
components: "Input Test Sequence" and "Timing Diagram View Manager ToolBar"
* __Properties__ -
deeds simulator, Simulation Timing diagram, and FSM contain the properties
window, which allows to set all the required parameters of the component under
construction. For instance, the Properties can contain:  "Switch Input",
"Push-Button", "Clock properties", "Output properties", "textbox properties".
We label all as 'Properties'
* __Study\_Materials__ -
the student is viewing some materials relevant to the course
(provided by the instructor)
* __FSM\_Es\_# of session\_# of exercise__ -
when the student is working on a specific exercise on 'Finite State Machine
Simulator' (e.g. FSM_Es_6_1)
* __FSM\_Related__ -
when the student is handling the components of Finite State Machine Simulator
* __Aulaweb__ -
students are using Aulaweb as a learning management system (based on Moodle)
which is used for the course of digital electronics at the University of Genoa.
In Aulaweb, the students might access the exercises, download them, upload their
work, check the forum news, etc.
* __Blank__ -
when the title of a visited page is not recorded
* __Other__ -
when the student is not viewing any pages described above, then we assigned
'Other' to the activity. This includes, for majority of the cases, the student
irrelevant activity to the course (e.g. if the student is on Facebook)

#### Student data
* __student_id__ [int] - the Id of a student from 1 to 115
* __first_name__ [string] - first name of a student
* __last_name__ [string] - last name of a student
* __last_update__ [date] - date on which was the student entry last updated

#### Log data
* __student_id__ [int] - the Id of a student from 1 to 115
* __session_id__ [int] - the number of a laboratory session from 1 to 6
* __present__ [int] - presence of a student on a session (basically boolean)

#### Session grades
* __student_id__ [int] - the Id of a student from 1 to 115
* __session_id__ [string] - the number of a laboratory session from 1 to 6
* __points__ [int] - number of points achieved from a session exercise by a student

#### Final grades 
Final grades (points) are recorded from two exam terms, therefore they're differented by number of attempt.
* __student_id__ [int] - the Id of a student from 1 to 115
* __excercise_name__ [string] - The excercise (question) name in final test
* __points__ [int] - number of points achieved from a final exercise by a student
* __attempt__ [int] - attempt number (1 to 2)

### Target conceptual model
<img src="/images/Logical.png" width="800">

### Stage database model
<img src="/images/stage_database_model.png" width="600">

### Target database model
<img src="/images/target_database_model.png" width="1100">

## HW2
<img src="/images/logical_data_map.png" width="1400">

## HW3

### Model
<img src="/images/datamart_model.png" width="400">

### DDL
* [DDL for create datamart](DDL/datamartdmEMPDDL.sql)
* [create datamart job for pentaho](ETL/datamart/createDatamarts.kjb)

### Datamart description
To answer at least two questions, 
we need identifiers of students in our data mart for analyzing dependencies and 
comparing the values of the monitored indicators.
Furthermore, we need their total grade, the sum of time spent on individual 
sessions and the mark from each session. Therefore we also added 
session IDs in order to filter and identify the sessions.

Now, in the data mart, we've got the data needed to analyze the dependencies between time spent on individual tasks, 
session marks and test results to answer the questions.

We have created a datamart with attributes:
* __student_id__ - student_id is needed to identifying a student to find the dependency of observed values,
* __session_id__ - session_id is needed to identifying a session to find dependency between session grades and time spend on task on each the session,
* __time__ - time spent on the tasks for one student and one session (if he did not participate in the exercise, the value is 0),
* __session_points__ - session points (if he did not participate in the exercise, the value is 0) and
* __final_points__ - maximum points from both attempts, the value is repeated for each session (if he did not participate in the exercise, the value is 0.)



### Dashboard
<img src="/images/report.png" width="1100">

### Questions
#### 1. Je nějaká spojitost mezi dobou strávenou na jednotlivých úlohách a známkou ze cvičení? Jaká?
...

#### 2. Je nějaká spojitost mezi dobou strávenou na jednotlivých úlohách a celkovou známkou? Jaká?
...

#### 3. Ovlivňuje některá ze známek ze cvičení výsledek u zkoušky více než ostatní? Jak?
...

## License:
Use of this data set in publications must be acknowledged by referencing the following publication [1]

[1] M. Vahdat, L. Oneto, D. Anguita, M. Funk, M. Rauterberg.: A learning analytics approach to correlate the academic achievements of students with interaction data from an educational simulator. In: G. Conole et al. (eds.): EC-TEL 2015, LNCS 9307, pp. 352-366. Springer (2015).
DOI: 10.1007/978-3-319-24258-3 26

This data set is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.