# 🧠 50 LeetCode SQL Problems — Solutions & Explanations

Welcome to my repository where I solve **50 curated LeetCode SQL problems** as part of my journey to become a stronger **Data Analyst & Data Engineer**.

This repo is designed to:

- Strengthen problem-solving skills  
- Practice real-world SQL patterns  
- Build analytical thinking  
- Show consistent weekly learning  
- Create a helpful resource for others learning SQL

---

## 📂 Repository Structure

Problems are organized by difficulty:

/Easy
/Medium
/Hard


Each file contains:

- ✔️ The **problem name**  
- ✔️ The **original LeetCode link**  
- ✔️ A clean, optimized **SQL solution**  
- ✔️ Comments explaining the logic  
- ✔️ Optional alternative approaches (when relevant)

---

## 🎯 Skills Covered

This challenge includes many SQL concepts:

- SELECT, WHERE, GROUP BY, HAVING  
- JOINs (Inner, Left, Right)  
- Subqueries  
- Common Table Expressions (CTEs)  
- Window Functions  
- Aggregations & Transformations  
- Filtering & Data Cleaning Logic  
- Analytical SQL Techniques  

---

## 🔥 Example Problem: *Average Time to Process Tasks*

Below is one of the solutions included in the repository.

```sql
SELECT 
    A2.machine_id, 
    ROUND(AVG(A2.timestamp - A1.timestamp), 3) AS processing_time
FROM Activity A1
JOIN Activity A2
    ON A1.machine_id = A2.machine_id
   AND A1.process_id = A2.process_id
   AND A1.activity_type = 'start'
   AND A2.activity_type = 'end'
GROUP BY A2.machine_id;

```

You can find the fully commented version inside the corresponding folder.

🚀 Posting Weekly on LinkedIn

I’m sharing one SQL problem per week on LinkedIn to build consistency and document my learning journey.

Each post includes:

The problem

What I learned

The GitHub link to the solution

A short explanation

Follow the journey here (and feel free to connect!):

👉 Your LinkedIn Profile URL Here

🤝 Contributions

This repo is mainly for educational purposes, but suggestions are welcome!
Feel free to open an issue or drop feedback.

⭐ Support

If this repository helps you, giving it a ⭐ would truly mean a lot.
Let’s grow together in our Data Analytics & Engineering journey!
