# Numerical & Simulation Methods Project

## 🔹 PART I — DIFFERENTIAL SYSTEMS

### ➤ Case I: Linear
1. **Write the 3x3 linear system matrix**  
2. **Solve analytically** using matrix exponential or diagonalization.  
3. **Implement Euler method** for the linear system.  
4. **Implement RK45** for the linear system.  
5. **Plot all three solutions**: analytical, Euler, RK45.  
6. **Plot absolute error** between numerical and exact solutions.  
7. **Discuss** accuracy, error, and computational steps.  

### ➤ Case II: Nonlinear
1. **Define nonlinear system** (e.g., with parameters \(a_1 = 0.5\), \(a_2 = -1\), \(a_3 = 0.25\)).  
2. **Implement Euler method**.  
3. **Implement RK45**.  
4. **Plot both solutions**: Euler and RK45.  
5. **Plot absolute error** between the two methods.  
6. **Discuss** stability, divergence, and numerical error.  

---

## 🔹 PART II — BVP (BEAM)

### ➤ Case I: Linear BVP
1. **Derive analytical solution** (manual integration with boundary conditions).  
2. **Implement shooting method** using Runge-Kutta.  
3. **Implement finite difference method**.  
4. **Plot all three solutions**.  
5. **Plot maximum absolute error**.  
6. **Discuss** accuracy and method comparison.  

### ➤ Case II: Nonlinear BVP
1. **Implement shooting method** with iteration.  
2. **Implement nonlinear finite difference method**.  
3. **Plot both solutions**.  
4. **Plot error**.  
5. **Discuss comparison** (convergence, difficulty).  

---

## 📑 REPORT CONTENTS
1. **Introduction**: Context and problem statement.  
2. **Mathematical models**: ODE system and beam BVP.  
3. **Method descriptions**: Euler, RK4, shooting, finite difference.  
4. **Results**: Plots, errors, and interpretations.  
5. **Discussion**: Stability, efficiency, and accuracy.  
6. **Conclusion**: Method preference and observations.  
7. **Final page**: Team breakdown (who did what).  

---

## 🧪 CODE DELIVERABLES
You need to provide the following `.m` files:  
- [x] **`Linear_diff_system.m`**:  
    - Implements Euler, RK45, exact solution, and error plots.  
- [x] **`Nonlinear_diff_system.m`**:  
    - Implements Euler, RK45, and error comparison between methods.  
- [ ] **`Linear_BVP.m`**:  
    - Includes analytical solution, shooting method, finite difference, and error plots.  
- [ ] **`Nonlinear_BVP.m`**:  
    - Implements shooting method, finite difference, and error comparison.  

---  