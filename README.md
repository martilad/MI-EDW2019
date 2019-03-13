# MI-EDW-2019

Semestral work for Enterprise Data Warehouse Systems at FIT CVUT.

## HW1

Data analysis, entity and DB model design.

### Data description

#### Features description
* __session__ - 
the number of laboratory session from 1 to 6
* __student_Id__ - 
the Id of student from 1 to 115
* __exercise__ - 
the Id of the exercise the student is working on. Each session contains 4 to 6 exercises, shown as 'Es_# of the session_# of the exercise' (e.g. Es_1_2: exercise 2 of session 1).
'Es' with no number means the student has not started the exercise yet
* __activity__ - 
the activities are labeled based on the title of web pages that are on focus / in the view of the student.
To ensure anonymity, we did not publish the exact name of visited pages by the students thus renamed and augmented the pages into 'activity' names.
To read about the details of activity labels, see 'activities_info.txt'.
* __start_time__ - 
the start date and time of a specific activity with the format: dd.mm.yyyy hh:mm:ss
* __end_time__ - 
the end date and time of a specific activity with the format: dd.mm.yyyy hh:mm:ss
* __idle_time__ - 
the duration of idle time between the start and end time of an activity in milliseconds
* __mouse_wheel__ - 
the amount of mouse wheel during an activity
* __mouse_wheel_click__ - 
the number of mouse wheel clicks during an activity
* __mouse_click_left__ - 
the number of mouse left clicks during an activity
* __mouse_click_right__ - 
the number of mouse right clicks during an activity
* __mouse_movement__ - 
the distance covered by the mouse movements during an activity
* __keystroke__ - 
the number of keystrokes during an activity

### Target conceptual model
<img src="/images/target_conceptual_model.jpg" width="800">

### Stage database model
<img src="/images/stage_database_model.jpg" width="800">

### Target database model
<img src="(/images/stage_database_model.jpg" width="800">