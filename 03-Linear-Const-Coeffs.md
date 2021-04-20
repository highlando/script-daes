# Linear DAEs with Constant Coefficients

## Basic Notions and Definitions

Consider the DAE in the form
\begin{equation}
E \dot x (t) = Ax(t) + f(t), (\#eq:gen-lin-cc-dae)
\end{equation}
where $E$, $A\in \mathbb R^{m,n}$ and $f\in \mathcal C(\mathbb I, \mathbb R^m)$ with, possibly, an initial condition
\begin{equation}
x(t_0) = x_0 \in \mathbb R^{n}. (\#eq:gen-lin-cc-dae-inic)
\end{equation}

<div class="JHSAYS">
<p>For utmost generality, we consider the case that <span class="math inline">\(m\neq n\)</span>, i.e. the number of equations does not meet the number of unknowns, but we will turn to the square case of <span class="math inline">\(m=n\)</span> soon.</p>
</div>

### Scalings and State Transformations

One can confirm that if $x$ is a solution to \@ref(eq:gen-lin-cc-dae) and $P\in \mathbb R^{n,n}$ is invertible, then $x$ is a solution to
\begin{equation*}
PE \dot x (t) = PAx(t) + Pf(t).
\end{equation*}

<div class="JHSAYS">
<p>This is a scaling of the equations.</p>
</div>

Similarly, if $Q\in \mathbb R^{n,n}$ is invertible, then $\tilde x := Q^{-1}x$ solves

\begin{equation*}
E Q \dot {\tilde x} (t) = AQ \tilde x(t) + f(t).
\end{equation*}

<div class="JHSAYS">
<p>This is a state transformation of the system.</p>
</div>
Thus, when talking of solvability of \@ref(eq:gen-lin-cc-dae), one may equivalently consider any regular $Q\in \mathbb R^{m,m}$, $P\in \mathbb R^{m,m}$ and the scaled and transformed system
\begin{equation}
\tilde E \dot{\tilde x}(t) = \tilde A \tilde x (t) + \tilde f(t), \quad \tilde x(0) = Q^{-1}x_0,
\end{equation}
where $\tilde E = PEQ$, $\tilde A = PAQ$, $\tilde f = Pf$, and $x=Q\tilde x$.

To characterize all scalings and state transformations, we define these operations as relations of matrix pairs:

### Strong Equivalence and Canonical Forms

\BeginKnitrBlock{definition}<div class="definition"><span class="definition" id="def:matrix-pair-equivalent"><strong>(\#def:matrix-pair-equivalent) </strong></span>Two pairs of matrices $(E_1, A_1)$ and $(E_2, A_2)$, with $E_1$, $A_1$, $E_2$, $A_2 \in \mathbb R^{m,n}$, are called *strongly equivalent*, if there exist regular matrices $P\in \mathbb R^{m,m}$, $Q\in \mathbb R^{n,n}$ such that
\begin{equation*}
E_2 = PE_1Q, \quad A_2 = PA_1Q.
\end{equation*}
In this case, we write 
$$(E_1, A_1) \sim (E_2, A_2).$$</div>\EndKnitrBlock{definition}

\BeginKnitrBlock{lemma}<div class="lemma"><span class="lemma" id="lem:strong-equivalence-RSI"><strong>(\#lem:strong-equivalence-RSI) </strong></span>The relation $\sim$ defined in Definition \@ref(def:matrix-pair-equivalent) defines an equivalence relation[^1].</div>\EndKnitrBlock{lemma}
\BeginKnitrBlock{proof}<div class="proof">\iffalse{} <span class="proof"><em>Proof. </em></span>  \fi{}Exercise.</div>\EndKnitrBlock{proof}

[^1]: Equivalence relation -- **RST**. **R**eflexive: $A\sim A$. **S**ymmetric: $A\sim B$, then $B\sim A$. **T**ransitive: $A\sim B$ and $B\sim C$, then $A\sim C$.

For a given equivalence relation on a set, one can define *equivalence classes* by considering all members that are equivalent to each other as basically the same. And for each class one may choose a representative, preferably in *canonical form*, i.e. a form that, e.g.,

1. comes with an simple or characteristic representation and
2. that allows for easy determination or analysis of quantities of interest.

<div class="JHSAYS">
<p>There can be infinitely many canonical forms. For our purposes and for the <em>strong equivalence</em> of matrix pairs, we will use the <em>Kronecker Canonical Form</em>.</p>
</div>

\BeginKnitrBlock{theorem}<div class="theorem"><span class="theorem" id="thm:kcf"><strong>(\#thm:kcf) </strong></span>
Let $E$, $A \in \mathbb C^{m,n}$. Then there exist nonsingular matrices $P\in \mathbb C^{m,m}$, $Q\in \mathbb C^{n,n}$ such that for all $\lambda \in \mathbb C$
\begin{equation*}
P(\lambda E -A)Q = 
\begin{bmatrix}
\mathcal L_{\epsilon_1} \\
& \ddots \\
&& \mathcal L_{\epsilon_p} \\
&&& \mathcal M_{\eta_1} \\
&&&& \ddots \\
&&&&& \mathcal M_{\eta_q} \\
&&&&&& \mathcal J_{\rho_1} \\
&&&&&&& \ddots \\
&&&&&&&& \mathcal J_{\rho_r} \\
&&&&&&&&& \mathcal N_{\sigma_1} \\
&&&&&&&&&& \ddots \\
&&&&&&&&&&& \mathcal N_{\sigma_s}
\end{bmatrix}
\end{equation*}
Where the block entries are as follows:

1. Every entry $\mathcal L_{\epsilon_j}$ is bidiagonal of size $\epsilon_j\times (\epsilon_j +1)$, $\epsilon_j \in \mathbb N \cup \{0\}$ of the form
   \begin{equation*}
   \lambda 
   \begin{bmatrix}
   0 & 1  \\
   & \ddots & \ddots \\
   && 0 & 1
   \end{bmatrix}
   -
   \begin{bmatrix}
   1 & 0  \\
   & \ddots & \ddots \\
   && 1 & 0
   \end{bmatrix}
   \end{equation*}
2. Every entry $\mathcal M_{\eta_j}$ is bidiagonal of size $(\eta_j+1)\times \eta_j$, $\eta_j \in \mathbb N \cup \{0\}$ of the form
   \begin{equation*}
   \lambda 
   \begin{bmatrix}
   1  \\
   0 & \ddots \\
   & \ddots & 1 \\
   && 0 
   \end{bmatrix}
   -
   \begin{bmatrix}
   0  \\
   1 & \ddots \\
   & \ddots & 0 \\
   && 1 
   \end{bmatrix}
   \end{equation*}
3. Every entry $\mathcal J_{\rho_j}$ is a Jordan block of size $\rho_j\times \rho_j$, $\rho_j \in \mathbb N \setminus \{0\}$, $\lambda_j \in \mathbb C$ of the form
   \begin{equation*}
   \lambda 
   \begin{bmatrix}
   1  \\
   & \ddots \\
   &&\ddots  \\
   &&& 1 
   \end{bmatrix}
   -
   \begin{bmatrix}
   \lambda_j & 1 \\
   & \ddots & \ddots \\
   &&& 1 \\
   &&& \lambda_j 
   \end{bmatrix}
   \end{equation*}
4. Every entry $\mathcal N_{\sigma_j}$ is a nilpotent block of size $\sigma_j\times \sigma_j$, $\sigma_j \in \mathbb N \setminus \{0\}$, of the form
   \begin{equation*}
   \lambda 
   \begin{bmatrix}
   0 &1\\
   & \ddots & \ddots \\
   &&& 1  \\
   &&& 0 
   \end{bmatrix}
   -
   \begin{bmatrix}
   1 \\
   & \ddots  \\
   &&&  \\
   &&&& 1 
   \end{bmatrix}
   \end{equation*}

The *Kronecker Canonical Form* is uniquely defined up to permutations of the blocks.</div>\EndKnitrBlock{theorem}

\BeginKnitrBlock{proof}<div class="proof">\iffalse{} <span class="proof"><em>Proof. </em></span>  \fi{}Very technical. Can be found, e.g., in the book: Gantmacher (1959) *The Theory of Matrices II*.</div>\EndKnitrBlock{proof}

Algorithm for computations exist[^2] but the computation is notoriously ill posed.


## Regularity and Solvability

In what follows we will consider the regular case with, among others, $E$ and $A$ as square matrices.

<div class="JHSAYS">
<p>Like for solving general equation systems, one can expect well posedness for the case that the numbers of equations equals the number of unknowns. Here <em>squareness</em> of the system is a necessary condition. For sufficiency one further needs that there are no redundant equations or incompatible equations. This is encoded in the <em>regularity</em>.</p>
</div>

\BeginKnitrBlock{definition}<div class="definition"><span class="definition" id="def:regularity"><strong>(\#def:regularity) </strong></span>Let $E$, $A \in \mathbb C^{n,n}$. The matrix pair $(E, A)$ is called *regular*, if the *characteristic polynomial* $p$, defined via
$$
p(\lambda) = \det (\lambda E- A),
$$
is not identically zero. If such a matrix pair is not regular, it is called *singular*.</div>\EndKnitrBlock{definition}

<div class="JHSAYS">
<p><em>Is not identically zero</em> means that there exists a <span class="math inline">\(\lambda_0\)</span> such that <span class="math inline">\(p(\lambda_0)=\det (\lambda_0 E - A) \neq 0\)</span>, i.e. <span class="math inline">\(\lambda_0 E - A\)</span> is invertible.</p>
</div>

<div class="JHSAYS">
<p>Since a characteristic polynomial has but a finite numbers of roots (unless it is the <em>zero polynomial</em>), <em>is not identically zero</em> means that <span class="math inline">\(p(\lambda) \neq 0\)</span> for all but a few <span class="math inline">\(\lambda\)</span>.</p>
</div>

Next we show, that *regularity* is invariant under *strong equivalence*. This is needed, since we will translate regularity of $(E,A)$ to regularity of the associated DAE and we need to ensure that regular scalings and state transformations do not affect regularity.

\BeginKnitrBlock{lemma}<div class="lemma"><span class="lemma" id="lem:invariance-regularity"><strong>(\#lem:invariance-regularity) </strong></span>Let $E$, $A \in \mathbb C^{n,n}$. If $(E, A)$ is strongly equivalent to a regular matrix pair, then $(E, A)$ is regular.</div>\EndKnitrBlock{lemma}

\BeginKnitrBlock{proof}<div class="proof">\iffalse{} <span class="proof"><em>Proof. </em></span>  \fi{}Let $E_1$, $A_1  \in \mathbb C^{n, n}$ be similar to $(E, A)$. By definition, there exist invertible $P$, $Q\in \mathbb C^{n,n}$ such that $\lambda E - A = P(\lambda E_1 -A_1)Q$ for all $\lambda$. Thus, 
$$
\det (\lambda E - A) = \det P \det (\lambda E_1 - A_1) \det Q
$$
is not identically zero, since $\det Q$ and $\det P$ are not zero and $\det (\lambda E_1 - A_1)$ is not the zero polynomial.</div>\EndKnitrBlock{proof}

With that we can derive a *canonical form* for *strongly equivalent* matrix pairs.

\BeginKnitrBlock{theorem}<div class="theorem"><span class="theorem" id="thm:weierstrass-cf"><strong>(\#thm:weierstrass-cf) </strong></span>Let $E$, $A \in \mathbb C^{n,n}$ and $(E,A)$ be regular. Then 
\begin{equation}
(E, A) = 
\left (
\begin{bmatrix}
I_{n_1} \\
& N
\end{bmatrix}
,
\begin{bmatrix}
J \\
& I_{n_2}
\end{bmatrix}
\right ),
(\#eq:weierstrass-cf)
\end{equation}

* where $n_1$, $n_2 \in \mathbb N$ such that $n=n_1+n_2$, 
* where $I_{n_1}$ and $I_{n_2}$ denote the identity matrices of size $n_1\times n_1$ and $n_2\times n_2$, respectively, 
* where $J\in \mathbb C^{n_1,n_1}$ is in *Jordan canonical form*,
* and where $N \in \mathbb C^{n_2,n_2}$ is a *nilpotent* matrix.
* Moreover, it is allowed that the one or the other block is not present, i.e., $n_1$ or $n_2$ can be zero.
</div>\EndKnitrBlock{theorem}

Recall that the *Jordan canonical form* can be achieved for any square matrix $M\in \mathbb C$ by a similarity transformation.

\BeginKnitrBlock{definition}<div class="definition"><span class="definition" id="def:unnamed-chunk-11"><strong>(\#def:unnamed-chunk-11) </strong></span>A matrix $M\in \mathbb C^{n,n}$ is called *nilpotent*, if there is an *index* $\nu \in \mathbb N$ such that $N^\nu=0$ whereas $N^{\nu-1} \neq 0$. In this case, the number $\nu$ is called the *index of nilpotency*.</div>\EndKnitrBlock{definition}

<div class="JHSAYS">
<p>With the convention that <span class="math inline">\(\mathbf 0^0=I\)</span>, the zero matrix <span class="math inline">\(\mathbf 0 \in \mathbb R^{n,n}\)</span> is of (nilpotency) index 1.</p>
</div>

\BeginKnitrBlock{proof}<div class="proof">\iffalse{} <span class="proof"><em>Proof. </em></span>  \fi{}To be provided.</div>\EndKnitrBlock{proof}

The relation of solvability and regularity of DAEs becomes evident in the canonical form of Theorem \@ref(thm:weierstrass-cf). In fact, it states that through regular scalings and state transforms, any DAE with 
$$
E\dot x(t) =  A x(t) + f(t)
$$
with $(E,A)$ regular can be transformed and split into
\begin{equation}
\dot x_1(t) = x_1(t) + f_1(t) (\#eq:reg-dae-wcf-diffpart)
\end{equation}
and 
\begin{equation}
N \dot x_2(t) = x_2(t) + f_2(t) (\#eq:reg-dae-wcf-algpart),
\end{equation}

i.e

* into an **ODE** \@ref(eq:reg-dae-wcf-diffpart) that already is in *Jordan canonical form*
* and a separated(!) **DAE** \@ref(eq:reg-dae-wcf-diffpart) of a particular type.

Since linear ODEs always have a unique solution for any initial value, solvability of a general linear DAE with constant, regular coefficients will be completely defined by solvability of the special DAE part \@ref(eq:reg-dae-wcf-diffpart).


<!--
\BeginKnitrBlock{definition}<div class="definition"><span class="definition" id="def:drazin-inverse"><strong>(\#def:drazin-inverse) </strong></span>
Let $E\in \mathbb C^{n,n}$ and $\nu = \ind(E)$. A matrix $X\in \mathbb C^{n,n}$ that fulfills 

\begin{align}
	EX & = XE, (\#eq:def-drazin-a) \\
	XEX & = X, (\#eq:def-drazin-b) \\
	XE^{\nu+1} & = E^{\nu}, (\#eq:def-drazin-c)
\end{align}

is called a *Drazin inverse* of $E$.</div>\EndKnitrBlock{definition}

With the following theorem we confirm that a Drazin inverse to a matrix $E$ is unique so that we can write $E^D$ for it.

\BeginKnitrBlock{theorem}<div class="theorem"><span class="theorem" id="thm:drazin-inverse-unique"><strong>(\#thm:drazin-inverse-unique) </strong></span>
Every matrix $E\in\mathbb{C}^{n,n}$ has one, and only one, Drazin inverse.
</div>\EndKnitrBlock{theorem}

\BeginKnitrBlock{proof}<div class="proof">\iffalse{} <span class="proof"><em>Proof. </em></span>  \fi{}Uniqueness: Let $X_1$ and $X_2$ be two Drazin inverses of $E$. Then by repeated application of the identities in \@ref(eq:def-drazin-a)--\@ref(eq:def-drazin-c) one derives that 

\begin{align*}
X_1 EX_1 E X_2 =   &X_1EX_2 = X_1EX_2EX_2  \\
X_1^2 E^2 X_2 = \dotsm=   &X_1EX_2 = \dotsm= X_1E^2X_2^2  \\
X_1^{\nu+1}E^{\nu+1} X_2 =\dotsm=\dotsm=   &X_1EX_2 =\dotsm=\dotsm= X_1E^{\nu+1}X_2^{\nu+1}  \\
X_1^{\nu+1}E^{\nu+1} X_1 =\dotsm=\dotsm=\dotsm=   &X_1EX_2 =\dotsm=\dotsm=\dotsm= X_2E^{\nu+1}X_2^{\nu+1}  \\
X_1 =\dotsm=\dotsm=\dotsm=\dotsm=   &X_1EX_2 =\dotsm=\dotsm=\dotsm=\dotsm= X_2, \\
\end{align*}

where in the second last step we used the identities

$$
	E^{\nu+1}X_1=X_1E^{\nu+1}=E^{\nu}=X_2E^{\nu+1}=E^{\nu+1}X_2.
$$</div>\EndKnitrBlock{proof}
-->

[^2]: Paul v. Dooren [The Computation of Kronecker’s Canonical Form of a Singular Pencil](https://perso.uclouvain.be/paul.vandooren/publications/VDooren79.pdf)
