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

Similarly, if $Q\in \mathbb R^{n,n}$ is invertible, then $\tilde x := Qx$ solves

\begin{equation*}
E Q \dot {\tilde x} (t) = AQ \tilde x(t) + f(t).
\end{equation*}

<div class="JHSAYS">
<p>This is a state transformation of the system.</p>
</div>
Thus, when talking of solvability of \@ref(eq:gen-lin-cc-dae), one may equivalently consider any regular $Q\in \mathbb R^{m,m}$, $P\in \mathbb R^{m,m}$ and the scaled and transformed system
\begin{equation}
\tilde E \dot{\tilde x}(t) = \tilde A \tilde x (t) + \tilde f(t), \quad \tilde x(0) = Qx_0,
\end{equation}
where $\tilde E = PEQ$, $\tilde A = PAQ$, $\tilde f = Pf$, and $x=Q^{-1}\tilde x$.

To characterize all scalings and state transformations, we define these operations as relations of matrix pairs:


\BeginKnitrBlock{definition}<div class="definition"><span class="definition" id="def:matrix-pair-equivalent"><strong>(\#def:matrix-pair-equivalent) </strong></span>Two pairs of matrices $(E_1, A_1)$ and $(E_2, A_2$, $E_1$, $A_1$, $E_2$, $A_2 \in \mathbb R^{m,n}$ are called *strongly equivalent*, if there exist regular matrices $P\in \mathbb R^{m,m}$, $Q\in \mathbb R^{n,n}$ such that
\begin{equation*}
E_2 = PE_1Q, \quad A_2 = PA_1Q.
\end{equation*}
In this case, we write 
$$(E_1, A_1) \sim (E_2, A_2).$$</div>\EndKnitrBlock{definition}

\BeginKnitrBlock{lemma}<div class="lemma"><span class="lemma" id="lem:strong-equivalence-RSI"><strong>(\#lem:strong-equivalence-RSI) </strong></span>The relation $\sim$ defined in Definition \@ref(def:matrix-pair-equivalent) defines an equivalence relation[^1].</div>\EndKnitrBlock{lemma}
\BeginKnitrBlock{proof}<div class="proof">\iffalse{} <span class="proof"><em>Proof. </em></span>  \fi{}Exercise.</div>\EndKnitrBlock{proof}

[^1]: Equivalence relation -- **RST**. **R**eflexive: $A\sim A$. **S**ymmetric: $A\sim B$, then $B\sim A$. **T**ransitive: $A\sim B$ and $B\sim C$, then $A\sim C$.

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
