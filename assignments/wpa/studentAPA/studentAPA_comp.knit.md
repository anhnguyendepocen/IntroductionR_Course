---
title: "Performance of students in Math and Porgugese"
shorttitle: "education"
author: 
  - name: Nathaniel Phillips
    affiliation: 1
    corresponding: yes    
    address: Missionsstrasse 62A 4053 Basel Switzerland
    email: nathaniel.phillips@unibas.ch
affiliation:
  - id: 1
    institution: University of Basel

abstract: |
  This data approach student achievement in secondary education of two Portuguese schools. The data attributes include student grades, demographic, social and school related features) and it was collected by using school reports and questionnaires. Two datasets are provided regarding the performance in two distinct subjects: Mathematics (mat) and Portuguese language (por). 
  
note: |  
  These data come from the UCI Machine Learning database at http://archive.ics.uci.edu/ml/datasets/Student+Performance#
  
keywords: "apa, R, markdown"

wordcount: X

class: man
lang: english
figsintext: yes  # Should figures be in text?
lineno: no     # Should line numbers be displayed?
bibliography:
  - studentAPA.bib  # What is the name of the bibliography file?

output: papaja::apa6_pdf
---



What is the relationship between student performance in language and mathematics tasks? This is an important question that has been studied extensively. For example, @horwitz1986foreign found that students frequently feel anxiety in foreign language classes. @collier1992synthesis combined several studies on language achievement and found that language-minority students may need special treatment plans. Interestingly, language appears to be related to performance in mathematics [@abedi2001language]. In one study based on a survey of 1,174 8th grade students, @abedi2001language found that students who were English language learners (ELLs) scored lower on math tests than proficient speakers of English.

The purpose of the present research was to see if previous results replicate in a new sample of language and mathematics learners. To test this, we analysed data of student performance in Mathematics and Portugese classes.

# Methods

## Participants

Data were collected from the UCI machine learning repository at http://archive.ics.uci.edu/ml/datasets/Student+Performance. Data from 395 students in a Mathematics class, and 649 students in a Portugese class were collected.

## Procedure

The primary measures were three exam scores taken at the beginning, middle, and end of each class. 

# Results

All analyses were conducted using R [@R] using the papaja package [@aust2015papaja].

Distributions of the three exam scores for the Mathematics and Portugese classes are presented in Figure 1. Correlations between numeric predictors in the Math data are shown in Figure 2.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{studentAPA_comp_files/figure-latex/fig1-1} 

}

\caption{Distributions of class scores.}(\#fig:fig1)
\end{figure}



\begin{figure}

{\centering \includegraphics[width=0.7\linewidth]{studentAPA_comp_files/figure-latex/fig2-1} 

}

\caption{Correlations of numeric variables in the math data.}(\#fig:fig2)
\end{figure}


Descriptive statistics of grades separated by sex and school are presented in Tables 1 and 2. Grades tended to increase over the course of the semester. For example, the mean grade in the first Portugese exam was 11.40 which increased to 11.91 by the last exam.

\begin{table}[tbp]
\begin{center}
\begin{threeparttable}
\caption{\label{tab:tbl1}Mean Portugese exam scores separated by sex and school}
\begin{tabular}{lllll}
\toprule
sex & \multicolumn{1}{c}{school} & \multicolumn{1}{c}{Exam 1} & \multicolumn{1}{c}{Exam 2} & \multicolumn{1}{c}{Exam 3}\\
\midrule
F & GP & 12.29 & 12.50 & 13.00\\
F & MS & 10.58 & 10.72 & 11.03\\
M & GP & 11.60 & 11.69 & 12.03\\
M & MS & 9.79 & 10.09 & 9.95\\
\bottomrule
\end{tabular}
\end{threeparttable}
\end{center}
\end{table}

\begin{table}[tbp]
\begin{center}
\begin{threeparttable}
\caption{\label{tab:tbl2}Mean Math exam scores separated by sex and school.}
\begin{tabular}{lllll}
\toprule
sex & \multicolumn{1}{c}{school} & \multicolumn{1}{c}{Exam 1} & \multicolumn{1}{c}{Exam 2} & \multicolumn{1}{c}{Exam 3}\\
\midrule
F & GP & 12.29 & 12.50 & 13.00\\
F & MS & 10.58 & 10.72 & 11.03\\
M & GP & 11.60 & 11.69 & 12.03\\
M & MS & 9.79 & 10.09 & 9.95\\
\bottomrule
\end{tabular}
\end{threeparttable}
\end{center}
\end{table}





Did men and women perform differently on the first exams in each class? To test this, we conducted two separate two-sample t-tests on first exam scores as a function of sex. The t-test on Portugese exam 1 was significant $\Delta M = -0.58$, 95\% CI $[0.16$, $1.00]$, $t(589.90) = 2.69$, $p = .007$, showing that women performed better than men on the first Portugese exam,

The t-test on Math exam 1 was non-significant $\Delta M = 0.61$, 95\% CI $[-1.27$, $0.05]$, $t(383.79) = -1.82$, $p = .069$, showing no evidence for a difference between men and women on Math exam 1.


\begin{table}[tbp]
\begin{center}
\begin{threeparttable}
\caption{\label{tab:unnamed-chunk-1}ANOVA on period 1 Portugese scores.}
\begin{tabular}{lllllll}
\toprule
Effect & \multicolumn{1}{c}{$F$} & \multicolumn{1}{c}{$\mathit{df}_1$} & \multicolumn{1}{c}{$\mathit{df}_2$} & \multicolumn{1}{c}{$\mathrm{MSE}$} & \multicolumn{1}{c}{$p$} & \multicolumn{1}{c}{$\eta^2_G$}\\
\midrule
School & 70.78 & 1 & 644 & 6.62 & < .001 & .099\\
Sex & 13.25 & 1 & 644 & 6.62 & < .001 & .020\\
Guardian & 9.13 & 2 & 644 & 6.62 & < .001 & .028\\
\bottomrule
\end{tabular}
\end{threeparttable}
\end{center}
\end{table}


# Discussion

Understanding the relationship between language and math performance is important for understanding learning. Our results are generally in line with @abedi2001language who found a relationship between language and mathematics performance.


# References


\setlength{\parindent}{-0.5in}
\setlength{\leftskip}{0.5in}
\setlength{\parskip}{8pt}
