# zlp-scheduler

This fork is created for demo purpose.
The main repository could be found [here](https://github.com/tamu-zlp/zlp-scheduler).

## Project Description

This project was done on behalf of the Zachary Leadership Program (ZLP) at Texas A&M University College Station. It was started in Spring 2020 with original team members, and I joined the project in Fall 2020.

## Demo
- [Poster](https://docs.google.com/presentation/d/e/2PACX-1vQOeMmUXTb1t6a_JneOMjHG89HUxqOjh_ZN9t2NCFOULtpOJbN9WBegkLC8N-dJJg/pub)
- Screenshots: [student](https://github.com/henrywang1/zlp-scheduler/blob/demo/Student_User_Guide_v3.pdf), [admin](https://github.com/henrywang1/zlp-scheduler/blob/demo/ZLP%20Scheduler%20Admin%20User%20Guide.pdf)
- [Demo Site](https://protected-forest-33941.herokuapp.com/)

## My contribution
- Created cucumber tests for legacy code
- Collaborated with others and increased the test coverage from `0` to `62.1%`
- Integrated SendGrid to send email to the students
- Refined the user login and registration UI
- Fixed several bugs
  * A user can reset his password before claiming an account
  * A user can claim his account multiple times
  * A user can use a weak password
  * A user can claim his account when password confirmation is incorrect
  * A user does not see any error message when the form submission has errors and is not saved
  
For more details, you can check [all my pull requests](https://github.com/tamu-zlp/zlp-scheduler/pulls?q=is%3Apr+author%3A%40me+is%3Aclosed).
