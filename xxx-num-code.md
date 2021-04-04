# Numerical Analysis and Software Overview

## Theory: RKMs and BDF for DAEs

Table: (\#tab:RKMs-DAEs-results) Overview of convergence results of RKM/BDF schemes for DAEs

|| DAEs |
|:-----------------------------|:------------------|
| unstructured, linear | $E(t)\dot x = A(t)x + f(t)$ |
| semi-linear | $E(t)\dot x = f(t,x)$ |
| unstructured | $F(t,\dot x, x)=0$ |
| unstructured, strangeness-free/index-1 | $\begin{cases}\hat F_1(t,\dot x, x)=0 \\ \hat F_2(t,x)=0 \end{cases}$ |
| semi-explicit, strangeness-free/index-1 | $\begin{cases}\dot x= f(t, x, y) \\ 0=g(t,x,y) \end{cases}$ |
| semi-explicit, index-2 | $\begin{cases}\dot x= f(t, x, y) \\ 0=g(t,y) \end{cases}$ |



<table class="table" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:unnamed-chunk-1)Overview of convergence results of BDF/RKM schemes for DAEs of various index and, possibly, semi-explicit structure. Here, we equate *index-1* and *strangeness-free*. A $\cdot$ indicates that this case is included in a result for a more general case \emph{located} left or above in the table.</caption>
 <thead>
<tr>
<th style="empty-cells: hide;border-bottom:hidden;" colspan="1"></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="6"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">RKM</div></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="6"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">BDF</div></th>
</tr>
<tr>
<th style="empty-cells: hide;border-bottom:hidden;" colspan="1"></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">unstructured</div></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">semi-explicit</div></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">unstructured</div></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">semi-explicit</div></th>
</tr>
  <tr>
   <th style="text-align:left;"> Problem / Index </th>
   <th style="text-align:left;"> $*$ </th>
   <th style="text-align:left;"> $2$ </th>
   <th style="text-align:left;"> $1$ </th>
   <th style="text-align:left;"> $*$ </th>
   <th style="text-align:left;"> $2$ </th>
   <th style="text-align:left;"> $1$ </th>
   <th style="text-align:left;"> $*$ </th>
   <th style="text-align:left;"> $2$ </th>
   <th style="text-align:left;"> $1$ </th>
   <th style="text-align:left;"> $*$ </th>
   <th style="text-align:left;"> $2$ </th>
   <th style="text-align:left;"> $1$ </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> nonlinear </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> c </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> g,i </td>
   <td style="text-align:left;"> b </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> f </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> h </td>
   <td style="text-align:left;"> e </td>
  </tr>
  <tr>
   <td style="text-align:left;"> linear TV </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> $\cdot$ </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> $\cdot$ </td>
   <td style="text-align:left;"> $\cdot$ </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> $\cdot$ </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> $\cdot$ </td>
   <td style="text-align:left;"> $\cdot$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> linear CC </td>
   <td style="text-align:left;"> a </td>
   <td style="text-align:left;"> $\cdot$ </td>
   <td style="text-align:left;"> $\cdot$ </td>
   <td style="text-align:left;"> $\cdot$ </td>
   <td style="text-align:left;"> $\cdot$ </td>
   <td style="text-align:left;"> $\cdot$ </td>
   <td style="text-align:left;"> d </td>
   <td style="text-align:left;"> $\cdot$ </td>
   <td style="text-align:left;"> $\cdot$ </td>
   <td style="text-align:left;"> $\cdot$ </td>
   <td style="text-align:left;"> $\cdot$ </td>
   <td style="text-align:left;"> $\cdot$ </td>
  </tr>
</tbody>
</table>

|| Description | Reference |
|:-:|:-----------------------------|:---------------------------|
| a | RKM, linear constant coefficients | KM Thm. 5.12 |
| b | RKM, nonlinear, strangeness-free/index-1, semi-explicit | KM Thm 5.16 / HW Thm. VI.1.1 |
| c | RKM, nonlinear, strangeness-free | KM Thm. 5.18 |
| d | BDF, linear constant coefficients | KM Thm. 5.24 |
| e | BDF($\subset$ MSM), nonlinear, strangeness-free/index-1, semi-explicit | KM Thm. 5.26 ($\subset$ HW Thm. VI.2.1) |
| f | BDF, nonlinear, strangeness-free/index-1 | KM Thm. 5.27 |
| g | RKM, nonlinear, index-2, semi-explicit | HW Ch. VII.4 |
| h | BDF, nonlinear, index-2, semi-explicit | HW Thm. VII.3.5 |
| i | half-explicit RKM, nonlinear, index-2, semi-explicit | HW Thm. VII.6.2 |
| HW | Ernst Hairer, Gerhard Wanner (1996) | *Solving ordinary differential equations. II: Stiff and differential-algebraic problems* |
| KM | Peter Kunkel, Volker Mehrmann (2006) | *Differential-Algebraic Equations. Analysis and Numerical Solution* |


## Solvers

As can be seen from the table above, generally usable discretization methods for unstructured DAEs are only there for index-1 problems. However, the solvers GELDA/GENDA include an automated reduction to the strangeness-free form so that they apply for any index; see Lecture Chapter 4++.

### Multi purpose

|| DAEs | Methods | h/p | Language | Remark | Avail |
|:----|:----|:-------|:---|:----|:-------------------------------|:--:|
| [GELDA](https://doi.org/10.1137/S1064827595286347) | l-$\mu$-$*$ | BDF/RKM | $*$/$*$ | F-77 | | $*$/$\cdot$ |
| [GENDA](https://www3.math.tu-berlin.de/cgi-bin/IfM/show_abstract.cgi?Report-730-2002.rdf.html) | n-$\mu$-$*$ | BDF | $*$/$*$ | F-77 | | $\phantom{*}$/$\cdot$ |
| [DASSL](http://www.netlib.org/ode/ddassl.f) | n-$\nu$-$1$ | BDF | $*$/$*$ | F-77 | base for *Sundials IDA* -- the base of many DAE solvers | $*$/$\phantom{\cdot}$ |
| [LIMEX](https://doi.org/10.1007/BF01400352) | sl-$\nu$-$1$ | x-SE-Eul | $*$/$*$ | F-77 |  | $\phantom{*}$/$\phantom{\cdot}$ |
| [RADAU](http://www.unige.ch/~hairer/prog/stiff/radau.f) | sl-$\nu$-$1$ | RKM | $*$/$*$ | F-77 |  | $*$/$\phantom{\cdot}$ |

Notes: 

|| Explanation |
|:------ | --------------------------------------------------- |
| DAEs | l-linear, sl-semilinear, nl-nonlinear|
|| classification: $\mu$-strangeness index, $\nu$-differentiation index |
|| $*$-includes index reduction |
| h/p | time step control / order control |
| availability | code for download / licence provided($*$) or other statement($\cdot$) |
| methods | x-SE-Eul: extrapolation based on semiexplicit Euler |

### Application specific

Furthermore, there are solvers for particularly structured DAEs.

| DAEs | Resources |
|:------------|:------------------------|
| Navier-Stokes (nl-se-$2$) | See, e.g., Sec. 4.3 of our [preprint](https://arxiv.org/abs/1901.04002) on definitions of different schemes |
| Multi-Body (nl-se-$3$) | See, e.g., the code on [Hairer's homepage](https://www.unige.ch/~hairer/software.html) |


## Software

Many software suits actually wrap [SUNDIALS IDA](https://computation.llnl.gov/projects/sundials/ida).


|| DAEs | Routines | Method | Remark |
|:---|:---|:---------------------|:---|:-----------------------------|
|Matlab| ind-$1$ | `ode15{i,s}` | BDF ||
|Python| --- |  | | no built-in functionality, DASSL/IDA wrapped in the modules [`scikit-odes`](https://github.com/bmcage/odes/tree/master), [`assimulo`](https://jmodelica.org/assimulo/index.html#), [`pyDAS`](https://github.com/jwallen/PyDAS), [`DAEtools`](http://daetools.com/docs/index.html) |
|Julia| ind-$1$ | [`DifferentialEquations.jl`](https://docs.juliadiffeq.org/latest/index.html) | BDF | calls SUNDIALS IDA |


