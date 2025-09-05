# SriLanka-Macroeconomics-PhillipsCurve

This repository contains an empirical analysis of the **Phillips Curve in Sri Lanka**, investigating whether the long-run trade-off between inflation and unemployment exists during the period **2001–2024**.

The study applies econometric and time-series methods using R, including regression analysis, stationarity checks, Granger causality tests, and Vector Autoregression (VAR). The findings suggest that Sri Lanka does not exhibit a stable Phillips Curve trade-off, with inflation largely influenced by structural and external factors rather than unemployment.

---

## 📌 Research Objective
- Examine the long-run validity of the Phillips Curve in Sri Lanka.  
- Test the relationship between **inflation** and **unemployment** using econometric methods.  
- Evaluate predictive power using **Granger causality** and **VAR models**.  
- Provide insights for macroeconomic policy in Sri Lanka.  

---

## 📊 Methods
- **Exploratory Data Analysis** (visualization of inflation vs unemployment)  
- **Regression Analysis** (simple and reciprocal models)  
- **Stationarity Testing** (Augmented Dickey-Fuller test)  
- **Autocorrelation Analysis** (ACF/PACF plots)  
- **Granger Causality Tests** (predictive relationship)  
- **Vector Autoregression (VAR)** (interdependence of inflation & unemployment)  

---

## 📂 Data Sources
- **World Bank** – Inflation rates  
- **Central Bank of Sri Lanka (CBSL)** – Unemployment statistics  
- **Department of Census & Statistics (DCS)** – Labor market data  

---

## 🔎 Key Findings
- No significant negative correlation between unemployment and inflation.  
- Regression results show unemployment is not a good predictor of inflation (**β = 0.4076, p = 0.77**).  
- Both inflation and unemployment series are **non-stationary**.  
- **Granger causality tests** show unemployment does not predict inflation.  
- **VAR models** confirm inflation is largely self-driven.  

---

## 📘 Conclusion
The Phillips Curve does **not hold in the long run** for Sri Lanka (2001–2024).  
Inflation dynamics are shaped by:  
- Supply shocks  
- Exchange rate fluctuations  
- Imported inflation  
- Policy responses  

Policymakers should not rely on a simple inflation–unemployment trade-off but consider broader macroeconomic factors.

---

## 🚀 How to Run the R Code
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/SriLanka-Macroeconomics-PhillipsCurve.git
   cd SriLanka-Macroeconomics-PhillipsCurve
