# Construction and Analysis of RKM for nonlinear DAEs

Now we consider RKM for nonlinear DAEs. We start with a DAE in *semi explicit* strangeness-free form and give general results on how to write down a general RKM for it and how to analyse the global error. Then, we consider general strangeness-free nonlinear DAEs and show that a certain class of RKM applies well -- namely those that can be constructed by collocation with Lagrange polynomials over the *Radau*, *Lobatto*, or *Gauss* quadrature points.

## General RKM for Semi-Explicit Strangeness-free DAEs

A semi explicit strangeness-free DAE is of the form
\begin{align}
\dot x &= f(t, x, y) (\#eq:semexp-dae-diff) \\
0 &= g(t, x, y) (\#eq:semexp-dae-alg)
\end{align}
with the Jacobian of $g$ with respect to $y$, i.e.
$$
\partial_y\otimes g(t, x(t), y(t)) =: g_y(t, x(t), y(t)),
$$
being invertible for all $t$ along the solution $(x,y)$.

Some observations:

 * this system is strangeness-free
 * under certain assumptions, any DAE can be brought into this form
 * in the linear case $E\dot z = Az +f$, with $z=(x,y)$, the assumptions basically mean that 
$$
 E = \begin{bmatrix} I & 0 \\ 0 & 0 \end{bmatrix} \quad\text{and}\quad 
 A = \begin{bmatrix} * & * \\ * & A_{22} \end{bmatrix},
$$
with $A_{22}(t)$ invertible for all $t$.
 * The condition $g_y$ invertible means that, locally, one could consider
$$
 \dot x = f(t, x, R(t,x)), \quad\text{with $R$ such that}\quad y=R(t,x).
$$
However, this is not practical for numerical purposes.

The general strategy to get a suitable formulation of a time discretization of system \@ref(eq:semexp-dae-diff)-\@ref(eq:semexp-dae-alg) by any RKM is to consider the perturbed version
\begin{align*}
\dot x = f(t, x, y),  \\
\varepsilon \dot y = g(t, x, y),
\end{align*}
which is an ODE, formulate the RKM, and then let $\varepsilon \to 0$. In the Hairer/Wanner Book, this approach is called *$\varepsilon$-embedding.

This is, consider

Table: (\#tab:RKM-semiexp-DAE) RKM applied to semi-explicit DAEs

||||
|:------------------|:------------------|:----------------|
| $x_{i+1} = x_i + h\sum_{j=1}^s\beta_j \dot X_{ij}$,   | $y_{i+1} = y_i + h\sum_{j=1}^s\beta_j \dot Y_{ij}$,   | |
| $\dot X_{ij} = f(t_i+\gamma_jh, X_{ij}, Y_{ij})$,   | $\varepsilon \dot Y_{ij} = g(t_i+\gamma_j h, X_{ij}, Y_{ij})$,   | $j=1,2,\cdots,s, \quad \quad (*)$|
| $X_{ij} = x_i + h\sum_{\ell=1}^s\alpha_{j\ell}\dot X_{i\ell}$,   | $\phantom{\varepsilon}Y_{ij} = y_i + h\sum_{\ell=1}^s\alpha_{j\ell}\dot Y_{i\ell}$,   | $j=1,2,\cdots,s,$ |

i.e., the RKM applied to an ODE in the variables $(x,y)$, and replace $(*)$ by 

$$
\dot X_{ij} = f(t_i+\gamma_jh, X_{ij}, Y_{ij}),\quad 0 = g(t_i+\gamma_j h, X_{ij}, Y_{ij}), \quad j=1,2,\cdots,s.
$$


\BeginKnitrBlock{theorem}\iffalse{-91-75-117-110-107-101-108-47-77-101-104-114-109-97-110-110-32-84-104-109-46-32-53-46-49-54-93-}\fi{}<div class="theorem"><span class="theorem" id="thm:unnamed-chunk-1"><strong>(\#thm:unnamed-chunk-1)  \iffalse (Kunkel/Mehrmann Thm. 5.16) \fi{} </strong></span>Consider a semi-explicit, strangeness-free DAE as in \@ref(eq:semexp-dae-diff)-\@ref(eq:semexp-dae-alg) with a consistent initial value $(x_0, y_0)$. The time-discretization by a RKM, 

 * with $\mathcal A$ invertible and $\rho:=1-\beta^T\mathcal A^{-1}e$, 
 * applied as in Table \@ref(tab:RKM-semiexp-DAE) with $\varepsilon=0$, 
 * that is convergent of order $p$ for ODEs 
 * and fulfills the *Butcher condition* $C(q)$ with $q\geq p+1$

leads to an global error that behaves like 
$$
\|\mathfrak X(t_N) - \mathfrak X_N\| = \mathcal O(h^k),
$$

where

 * $k=p$, if $\rho=0$,
 * $k=\min\{p, q+1\}$, if $-1\leq \rho < 1$
 * $k=\min\{p, q-1\}$, if $\rho =1$.

If $|\rho|>1$, then the RKM -- applied to \@ref(eq:semexp-dae-diff)--\@ref(eq:semexp-dae-alg) -- does not converge.
</div>\EndKnitrBlock{theorem}

Some words on the conditions on $p$, $q$, and $\rho$:

 * For *stiffly accurate* methods, $\beta^T \mathcal A^{-1}e=1$ and, thus, $\rho=0$ $\rightarrow$ no order reduction for *strangeness free* or *index-1* systems
 * For the *implicit midpoint rule* also known as the *1-stage Gauss method*:
   $$
\begin{array}{c|c}
\frac 12 & \frac 12 \\
\hline
 & 1  
\end{array}
   $$

    * the convergence order for ODEs is $p=2$
    * but $1-\beta^T \mathcal A^{-1}e = 1- 1\cdot {\bigl(\frac 12\bigr)}^{-1} 1 = -1$, so that $\min\{p-1, q\} = k \leq 1$, depending on $q$.
    * in fact $k=1$ as
      $$
      C(q): \quad \sum_{\ell=1}^s\alpha_{j\ell}\gamma_\ell^{\bar k-1}=\frac{1}{\bar k} \gamma_j^{\bar k}, \quad {\bar k}=1,\cdots,q, \quad j=1,\cdots,s
      $$
      in the present case of $s=1$, $\alpha_{11}=\gamma_1=\frac 12$ is fulfilled for ${\bar k}=1: \quad \frac 12 = \frac 12$ 
    * it is not relevant here, but for ${\bar k}=2:\quad \frac 12 \cdot \frac 12 \neq \frac 12 \cdot \frac 14$

## Collocation RKM for Implicit Strangeness-free DAEs

The general form of a *strangeness-free* DAE is given as
\begin{align}
\hat F_1(t,x,\dot x) &= 0 (\#eq:impl-sf-dae-fone)\\
\hat F_2(t,x) &= 0 (\#eq:impl-sf-dae-ftwo)
\end{align}
where the *strangeness-free* or *index-1* assumption is encoded in the existence of *implicit functions* $\mathcal L$, $\mathcal R$ such that, with $x=(x_1,x_2)$, the implicit DAE \@ref(eq:impl-sf-dae-fone)--\@ref(eq:impl-sf-dae-ftwo) is equivalent to the semi-explicit DAE
\begin{align*}
  \dot x_1  &= \mathcal L(t,x_1,x_2) \\
   0 &= \mathcal R(t,x_1) -x_2
\end{align*}

In what follows we show that a *collocation* approach coincides with certain RKM discretizations so that the convergence analysis of the RKM can be done via approximation theory.

> Regression (Collocation): -- If one looks for a function $x\colon [0,1] \to \mathbb R^{}$ that fulfills $F(x(t))=0$ for all $t\in[0,1]$, one may interpolate $x$ by, say, a polynomial $x_p(t) = \sum_{\ell=0}^kx_\ell t^\ell$ and determine the $k+1$ coefficients $x_\ell$ via the solution of the system of (nonlinear) equations $F(x_p(t_\ell))=0$, $\ell=0,1,\dotsc,k$, where the $t_\ell\in[0,1]$ are the $k+1$ *collocation points*.

Concretely, we parametrize $s$ collocation points via
\begin{equation}
0 = \gamma_0 < \gamma_1 <\gamma_2< \dotsc < \gamma_s=1 (\#eq:rkm-collo-gamma)
\end{equation}
and define two sets of *Lagrange polynomials*
$$
L_\ell(\xi) = \prod_{j=0,j\neq \ell}^s \frac{\xi-\gamma_j}{\gamma_\ell-\gamma_j}
\quad\text{and}\quad
\tilde L_\ell(\xi) = \prod_{m=1,m\neq \ell}^s \frac{\xi-\gamma_m}{\gamma_\ell-\gamma_m},
$$
with $\ell\in\{0,1,\dotsc,s\}$.

Let $\mathbb P_k$ be the space of polynomials of degree $\leq k-1$. We define the *collocation polynomial* $x_\pi \in \mathbb P_{s+1}$ via 
\begin{equation}
x_\pi (t) = \sum_{\ell=0}^s X_{i\ell}L_\ell\bigl(\frac{t-t_i}{h}\bigr)
(\#eq:rkm-coll-collpol)
\end{equation}
 designed to compute the *stage values* $X_{i\ell}$, where $X_{i0}=x_i$ is already given.

The stage derivatives are then defined as
\begin{equation}
\dot X_{ij} = \dot x_\pi(t_i+\gamma_jh) = \frac 1h \sum_{\ell=0}^sX_{i\ell}\dot L_\ell(\gamma_j). (\#eq:rkm-coll-staged)
\end{equation}

To obtain $x_{i+1}=x_\pi(t_{i+1})=X_{is}$, we require the polynomial to satisfy the DAE \@ref(eq:impl-sf-dae-fone)--\@ref(eq:impl-sf-dae-ftwo) at the collocation points $t_{ij}=t_i+\gamma_jh$, that is

\begin{equation}
\hat F_1(t_i+\gamma_jh,X_{ij},\dot X_{ij}) = 0, \quad \hat F_2(t_i+\gamma_jh,X_{ij}) = 0, \quad j=1,\dotsc,s. \phantom{F_1} (\#eq:impl-sf-dae-collo)
\end{equation}

Now we show that this collocation defines a RKM discretization of \@ref(eq:impl-sf-dae-fone)--\@ref(eq:impl-sf-dae-ftwo).

Since $\tilde L_\ell \in \mathbb P_s$ for $\ell=1,\ldots,s$ it holds that
$$
P_\ell(\sigma):=\int_0^\sigma \tilde L_\ell (\xi)d\xi \in \mathbb P_{s+1}
$$
that is, by *Lagrange* interpolation, it can be written as 
$$
P_\ell(\sigma) = \sum_{j=0}^s P_\ell(\gamma_j)L_j(\sigma).
$$

If we differentiate $P_\ell$, we get 
$$
\dot P_\ell(\sigma) = \sum_{j=0}^s P_\ell(\gamma_j)\dot L_j(\sigma) = \sum_{j=0}^s \int_0^{\gamma_j} \tilde L_\ell (\xi)d\xi \dot L_j(\sigma)=: \sum_{j=0}^s \alpha_{j\ell} \dot L_j(\sigma)
$$
where define simply define
$$
\alpha_{j\ell} = \int_0^{\gamma_j} \tilde L_\ell (\xi)d\xi.
$$
Note that $\alpha_{0\ell}=0$ such that summation in $\dot P_\ell(\sigma)$ starts at $j=1$ instead of $j=0$.
Moreover, by definition of $P_\ell$ (and the *fundamental theorem of calculus*), it holds that 
$$
\dot P_\ell(\sigma) = \tilde L_\ell(\sigma),
$$
which gives that $\dot P_\ell(\gamma_m) = \delta_{\ell m}$ that is
$$
\dot P_\ell(\gamma_m) = \sum_{j=1}^s\alpha_{j\ell}\dot L_j(\gamma_m) = 
\begin{cases}
1, &\quad \text{if }\ell =m \\
0, &\quad \text{otherwise} 
\end{cases}
$$
for $\ell, m=1,\dotsc,s$.

Accordingly, if we define $\mathcal A := \bigl[\alpha_{j\ell}\bigr]_{j,\ell=1,\dotsc,s} \in \mathbb R^{s,s}$ and 
$$
V:=\bigl[v_{mj}\bigr]_{m,j=1,\dotsc,s} = \bigl[ \dot L_j(\gamma_m) \bigr]_{m,j=1,\dotsc,s} \in \mathbb R^{s,s} ,
$$
it follows that $V=\mathcal A^{-1}$.

Moreover, since,
$$
\sum_{j=0}^s L_j(\sigma) \equiv 1, \quad\text{so that }\quad\sum_{j=0}^s \dot L_j(\sigma) \equiv 0,
$$
we have that 
$$
\sum_{j=0}^s \dot L_j(\gamma_m) =0= \sum_{j=0}^s v_{mj}
$$
and, thus,
$$
v_{m0} = -\sum_{j=1}^s \dot L_j(\gamma_m) = -e_m^TVe.
$$
With these relations we rewrite \@ref(eq:rkm-coll-staged) as 
$$
h\dot X_{im} = \sum_{\ell=0}^sX_{i\ell}\dot L_\ell(\gamma_m) = v_{m0}x_i + \sum_{\ell=1}^sv_{m\ell}X_{i\ell}.
$$
and $h\sum_{m=1}^s\alpha_{\ell m} \dot X_{im}$ as
\begin{align}
  h\sum_{m=1}^s \alpha_{\ell m}\dot X_{im} &= \sum_{m=1}^s \alpha_{\ell m}v_{m0}x_i + \sum_{j,m=1}^s \alpha_{\ell m}v_{mj}X_{ij} \notag \\
  &= -e_\ell^T \mathcal AV e x_i + \sum_{j=1}^se_\ell^T \mathcal AVe_jX_{ij} (\#eq:collo-is-RKM-formula)\\
  &= -x_i + X_{i\ell}, \notag
\end{align}
which, together with \@ref(eq:impl-sf-dae-collo), indeed defines a RKM.

Some remarks:

 * the preceding derivation shows that the collocation \@ref(eq:rkm-coll-collpol) and \@ref(eq:impl-sf-dae-collo) is equivalent to the RKM scheme \@ref(eq:collo-is-RKM-formula) and \@ref(eq:impl-sf-dae-collo)
 * convergence of these schemes applied to \@ref(eq:impl-sf-dae-fone)--\@ref(eq:impl-sf-dae-ftwo) is proven in Kunkel/Mehrmann Theorem 5.17
 * with fixing $\gamma_s=1$, the obtained RKM is *stiffly accurate*
 * the remaining $s-1$ $\gamma$s can be chosen to get optimal convergence rates $\rightarrow$ RadauIIa schemes
 * if also $\gamma_s$ is chosen optimal in terms of convergence, the Gauss schemes are obtained
