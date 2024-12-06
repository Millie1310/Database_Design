# 📚 Fitness Database Project README  
Welcome! This README provides **step-by-step instructions** for setting up and working with the Fitness_Final database project. Follow the guide to ensure smooth execution and success! 🚀  

---

## 📑 **Table of Contents**  
1. [🚀 Project Overview](#-project-overview)  
2. [📊 Data Overview](#-data-overview)  
3. [🛠️ Prerequisites](#️-prerequisites)  
4. [🗂️ Schema Design](#️-schema-design)  
5. [📋 Steps](#steps)  
   - [1️⃣ Load Data into Power BI](#1️⃣-load-data-into-power-bi)  
   - [2️⃣ Export Data to SQL Server](#2️⃣-export-data-to-sql-server)  
   - [3️⃣ Write DDL and DML Scripts](#3️⃣-write-ddl-and-dml-scripts)  
   - [4️⃣ Reference the ERD](#4️⃣-reference-the-erd)  
6. [⚙️ Installation Instructions](#️-installation-instructions)  
7. [📝 Question From My Data](#questions-from-my-data)  

---

## 🚀 **Project Overview**  
This project creates the **Fitness_Final_Presentation database**, showcasing the relationship between fitness data (sleep, steps, activities, etc.). The database is designed with:  
- **📂 Dimension Tables (`dim` schema):** Stores descriptive data like day types, activities, and sleep quality.  
- **📊 Fact Tables (`f` schema):** Holds transactional data for sleep and steps metrics.  

The goal is to build a **robust, normalized database** for analytics and BI insights.  

---

## 📊 **Data Overview**  
This dataset tracks **fitness metrics** such as:  
- **🛌 Sleep Data:** Deep sleep time, shallow sleep time, wake time, and quality.  
- **🏃 Steps Data:** Daily steps, distance, running stats, calories burned, and more.  

The data is ideal for generating insights into daily patterns, fitness trends, and health improvements! 💪  

---

## 🛠️ **Prerequisites**  
Before starting, make sure you have the following installed:  
- **💻 Power BI Desktop**  
- **🛠️ Microsoft SQL Server Management Studio (SSMS)**  
- **📊 Excel**  
- **📈 DAX Studio (optional, for exporting data)**  

---

## 🗂️ **Schema Design**  
The **Fitness_Final_Presentation database** consists of:  

### 🟩 **Dimension (dim) Schema**  
- **DayType:** Weekday/Weekend info.  
- **Activity:** Types of activities performed.  
- **SleepQuality:** Quality of sleep categorized into Good, Poor, and Excellent.  

### 🟦 **Fact (f) Schema**  
- **Sleep:** Metrics like sleep duration and quality.  
- **Steps:** Details of steps, distance, calories, and more.  

---

## 📋 **Steps**  

### 1️⃣ **Load Data into Power BI**  
**File Provided:** *Fitness_Data.xlsx*  

#### 🔄 Steps:  
1. Open **Power BI Desktop** and import the file.  
2. Transform the data:  
   - Verify data types (e.g., dates, numbers).  
   - Clean and rename columns for clarity.  
3. Load the cleaned data into the Power BI model.  

---

### 2️⃣ **Export Data to SQL Server**  
#### 🗄️ Database Setup:  
1. Open **SSMS** and create a new database: `Fitness_Final_Presentation`.  
2. Export transformed tables from Power BI using **DAX Studio** or **Power BI export options**.  

#### 🧪 Verify:  
Run basic SQL queries to ensure the data matches the expected structure.  

---

### 3️⃣ **Write DDL and DML Scripts**  
#### ✍️ **DDL (Data Definition Language):**  
- Refer to the folder [DDL](https://github.com/Millie1310/Database_Design/tree/main/DDL).  
- Use [DDL_FinalProject.sql](https://github.com/Millie1310/Database_Design/blob/main/DDL/DDL_FinalProject.sql) for quick implementation or [DDL.ipynb](https://github.com/Millie1310/Database_Design/blob/main/DDL/DDL.ipynb) for detailed explanations.  

#### 🛠️ **DML (Data Manipulation Language):**  
- Refer to the folder [DML](https://github.com/Millie1310/Database_Design/tree/main/DML).  
- Use [DML.sql](https://github.com/Millie1310/Database_Design/blob/main/DML/DML.sql) for direct scripts or [DML.ipynb](https://github.com/Millie1310/Database_Design/blob/main/DML/DML.ipynb) for step-by-step details.  

---

### 4️⃣ **Reference the ERD**  
- Refer to the **Entity Relationship Diagram (ERD)** below:
 ![Image](https://github.com/Millie1310/Database_Design/blob/main/Database/Mitali_ERD.png)
- The diagram shows relationships between tables and ensures proper implementation.  

---

## ⚙️ **Installation Instructions**  

1. **Clone the Repository:**  
   ```bash  
   git clone https://github.com/millie1310/Fitness_Database_Project.git  

----

## Questions From My Data
