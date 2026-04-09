# 🧬 HIV Prevention Analysis with VRC01

## 🛠️ Tech Stack
<p>
  <img src="https://img.shields.io/badge/R-276DC3?style=for-the-badge&logo=r&logoColor=white"/>
  <img src="https://img.shields.io/badge/Survival%20Analysis-4CAF50?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Cox%20Model-FF9800?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Kaplan--Meier-9C27B0?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Data%20Analysis-607D8B?style=for-the-badge"/>
</p>

---

## Authors

- **Ninh Giang Nguyen** - check Linkedin [here](https://www.linkedin.com/in/ninhgiangnguyen/) 
- **Linh Vuong**  - check Linkedin [here](https://www.linkedin.com/in/linh-ngoc-vuong/)

---

## Background


Human Immunodeficiency Virus (HIV) remains a major global public health challenge, with millions of new infections each year. Preventive strategies, such as vaccines and antibody-based therapies, have the potential to reduce transmission. One such treatment, **VRC01**, is a broadly neutralizing antibody that has shown promising results in early studies. However, its effectiveness in preventing HIV infection needs to be carefully evaluated using data from large clinical trials.

In this project, we act as biostatistical analysts at a pharmaceutical company. Our team analyzes data from two randomized clinical trials (**HVTN 704** and **HVTN 703**) conducted among HIV-uninfected participants to evaluate the efficacy of VRC01 in reducing the risk of HIV infection.

The goal is to produce a statistical analysis report supported by appropriate models, tables, and visualizations.

---

## Objectives

- Evaluate whether VRC01 reduces the risk of HIV infection  
- Quantify treatment effectiveness (hazard ratios, confidence intervals)  
- Investigate the impact of age and geographic region  
- Examine potential interaction effects and report additional relevant findings  

<img width="761" height="350" alt="image" src="https://github.com/user-attachments/assets/77cf3115-a581-4a16-ae4b-05d7ea73ef51" />

- Find deliverable 👉 [here](https://github.com/ninhgiang225/hiv-clinical-trial-insights/tree/main/docs)
---

## Dataset Description

The dataset `amp.csv` includes the following variables:

- **protocol** – Trial protocol (HVTN 704 or HVTN 703)  
- **pub_id** – Publication ID  
- **tx** – Treatment assignment  (T1 = Low-dose, T2 = High-dose, C3 = Placebo)  
- **tx_pool** – Pooled treatment assignment  (0 = Treatment, 1 = Placebo)
- **rx** – Treatment label  
- **hiv1event** – HIV infection indicator (1 = Yes, 0 = No)  
- **hiv1survday** – Follow-up time (days since enrollment)  
- **age** – Age at enrollment (years)  
- **country** – Country of origin  
- **region1** – USA / Switzerland  
- **region2** – Brazil / Peru  
- **region3** – South Africa  
- **region4** – Other sub-Saharan African countries  

---

## Methods Overview

- Kaplan–Meier survival analysis  
- Log-rank test for group comparison  
- Cox proportional hazards models  
  - Treatment-only model  
  - Dose-specific model  
  - Multivariable model (age + region)  
  - Interaction model (treatment × age)  

---

## Notes

- Full statistical details, assumptions, and R code are provided in the Appendix.  
- This project is part of coursework for SC328 (Biostatistics / Survival Analysis).  

---
