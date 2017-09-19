Intro to Statistics with R
========================================================
author: Dr. Nathaniel Phillips
font-import: http://fonts.googleapis.com/css?family=Roboto
font-family: 'Roboto'
date: 22 Feb 2017
autosize: true


.
.
.
.
.

![plot of chunk unnamed-chunk-1](R_Spring_Day0_Presentation-figure/unnamed-chunk-1-1.png)

*** 

![plot of chunk unnamed-chunk-2](R_Spring_Day0_Presentation-figure/unnamed-chunk-2-1.png)




Welcome!
========================================================
incremental: true
left: 70%

- Syllabus: http://www.rpubs.com/yarrr/syllabus_Spring2017
- Dr. Nathaniel D. Phillips
- Post-doctoral researcher at Economic Psychology. Research interests: Judgment and decision making, learning, statistical reasoning.
- 6 years ago I had never used R. Since then I use it almost every day. All day. I love it.

***

![alt text](rlogo.png)





Why R is so great
========================================================
incremental: true
left: 70%

- It is **Free**!

<img src="free.jpg" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" width="200px" style="display: block; margin: auto;" />

- It is **Powerful**

<img src="hulk.jpg" title="plot of chunk unnamed-chunk-4" alt="plot of chunk unnamed-chunk-4" width="200px" style="display: block; margin: auto;" />

 ***
 
- It is **Replicable**

<img src="replication.jpg" title="plot of chunk unnamed-chunk-5" alt="plot of chunk unnamed-chunk-5" width="200px" style="display: block; margin: auto;" />

- It is **Social**

<img src="friendship.jpg" title="plot of chunk unnamed-chunk-6" alt="plot of chunk unnamed-chunk-6" width="200px" style="display: block; margin: auto;" />


Why can R be challenging to learn?
========================================================
incremental: true
left: 70%


- R does not hold your hand and make decisions for you. It forces you to **think about your data and analysis.**
- R has (almost) no menus so you can't do anything by clicking. You have to **type everything by hand!**
- If you make even the **smallest mistake / typo** in your writing, R won't work, and probably also won't tell you what you did wrong.
   - For this reason, it is crucial that you learn R with someone to help you fix errors.

***

<img src="SPSSviolin.jpg" title="plot of chunk unnamed-chunk-7" alt="plot of chunk unnamed-chunk-7" width="200px" style="display: block; margin: auto;" /><img src="Rviolin.png" title="plot of chunk unnamed-chunk-7" alt="plot of chunk unnamed-chunk-7" width="200px" style="display: block; margin: auto;" />


This is a Flipped Course
========================================================
incremental: true
left: 70%

![alt text](flippedclass.png)

- In a **Flipped Classroom**, you learn **new topics at home**, and **practice them in class**.
- In my experience, this is **the best way to learn programming**.
    - Learning programming in a lecture format is very difficult.
    - It is better to **learn by practicing** and getting **immediate help** from me and your fellow classmates.

Materials
========================================================
incremental: false
left: 70%

- I will provide you with all of the **readings on the course syllabus.**
- Most readinds will come from the book **YaRrr! The Pirate's Guide to R!**
- You do **not need to turn in any work from home**. 
- Readings will introduce you to new topics, show you example code, and provide you with some exercises.
- There are **tons of great resources for learning R**. If you struggle with a topic, don't be afraid to **Google it!** or **come to my office**.

***
![alt text](yarrrcover.jpg)
![alt text](googlelogo.png)
![alt text](youtubelogo.png)




Weekly Programming Assignments (WPA)
========================================================
incremental: true
left: 70%

<img src="grouphacking.gif" title="plot of chunk unnamed-chunk-8" alt="plot of chunk unnamed-chunk-8" width="400px" style="display: block; margin: auto;" />


- In class, you will **work together** to complete as many tasks from the Weekly Programming Assignment (WPA) as you can.
- Each assignment has a **Checkpoint**, your goal should be pass this checkpoint.
- At the end of class you will turn in **what you complete in class**.
    - If you turn in your work, you will get credit!!! It does *not* matter how much you complete!!!
    - If you don't reach the checkpoint, you should continue working outside of class on your own to catch up.





Go at your own pace
========================================================
incremental: false
left: 70%

![alt text](drawingprogression1.png)
![alt text](drawingprogression.png)

- We have a **diverse class**. Different people have different backgrounds in programming and statistics.
- It’s totally ok If you can’t complete all tasks in a WPA! **Take your time, keep trying, ask for help**.
- If you have programmed before, **challenge yourself, and help your classmates!**


Tips
========================================================
incremental: true

**Work together and be noisy in class!**

**Ask Questions!**



```
  sex shower
1   m      5
2   m      7
3   f     10
4   f      9
```



```r
# Question 1: Conduct a test to see if men take longer showers on average than women
```


- Level 1. I don't understand the problem and I have absolutely no idea how to get started. **What is the problem and what I am supposed to do?**
- Level 2. I understand the problem but I'm not sure what a solution would look like.  **Help me get started!**
- Level 3. I understand the problem and I (think I) know a solution, but my code is not working the way I want it to. **What's wrong with my code?**
- Level 4. I understand the problem, and I have a solution that works, but I don't know *why* and *how* it works. **How and why this code works?** 
- Level 5. I understand the problem, I have a solution, and I know why it works, but I don't know if it is the best way to solve the problem. **Is there a better way to solve this problem?**     



<!-- Here are some great questions to ask (either your classmmates or me) -->

<!-- 1. I have **absolutely no idea** how to answer this question. -->
<!-- 2. I think I am supposed to use do a t-test but **I'm not sure how to get started**, can you help? -->
<!-- 3. I wrote some code but **it's not working**, can you help? -->
<!-- 4. My code **is working but I have no idea why** because I just copied it from the reading, can you explain how it works? -->
<!-- 5. My code is working and I understand it, but **is there a better way to do it**? What if I wanted to change it slightly to answer a different question? -->








This is the start of your R journey...
========================================================
incremental: true

<img src="frodojourney.jpg" title="plot of chunk unnamed-chunk-11" alt="plot of chunk unnamed-chunk-11" width="400px" style="display: block; margin: auto;" />
- This course will just be the **beginning of your R journey**.
- You will not become an R expert after this course. That's just not possible in a semester
- You will understand how the R language works, and learn the basic techniques of data analysis.
- After this course, you will be prepared to **actively learn new topics on your own**.


Final Project
========================================================
incremental: true

- At the end of the course you will complete a **final analysis project**.
- You will produce a short report analyzing a **data set of your choosing (eg., Master's thesis data)**.
- If you don't have a data set, I will help you find one.
- The last 2 weeks of class are entirely dedicated to helping you with your final project.

***
![alt text](finalreport.jpg)

Grading
========================================================
incremental: true

![alt text](grading.jpg)

- This is a pass/fail course.
- **If you turn in your assignments, you get full credit**.
- If you turn in your assignments and the final project, you will pass.
- The amount that you actually **learn is up to you!**

Questions?
========================================================
incremental: true

![alt text](questions.jpg)


Let's get started!
========================================================
incremental: false

![alt text](seed.jpg)

- Go to the syllabus [http://www.rpubs.com/yarrr/syllabus_Spring2017](http://www.rpubs.com/yarrr/syllabus_Spring2017) and open your first progamming assignment WPA#0