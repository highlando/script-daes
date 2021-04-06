\newcommand{\rank}{\operatorname{rank}}
\newcommand{\kernel}{\operatorname{kernel}}
\newcommand{\corange}{\operatorname{corange}}
\newcommand{\range}{\operatorname{range}}
\newcommand{\cokernel}{\operatorname{cokernel}}

# Linear DAEs with Time-varying Coefficients

\BeginKnitrBlock{theorem}<div class="theorem"><span class="theorem" id="thm:local-canonical-form"><strong>(\#thm:local-canonical-form) </strong></span>Let $E, A \in \mathbb C^{m,n}$ and let
\begin{equation}
T,~Z,~T',~V (\#eq:lcf-subspaces)
\end{equation}
be 

| Matrix | as the basis of |
|:-------|:----------------|
|$T$ | $\kernel E$ |
|$Z$ | $\corange E = \kernel E^H$ |
|$T'$ | $\cokernel E = \range E^H$ |
|$V$ | $\corange (Z^HAT)$ |

then the quantities
\begin{equation}
r,~a,~s,~d,~u,~v (\#eq:lcf-quantities)
\end{equation}
defined as 

| Quantity | Definition | Name |
|:-------|:-------------|:-----|
|$r$ | $\rank E$ | *rank* |
|$a$ | $\rank (Z^HAT)$ | *algebraic part* |
|$s$ | $\rank (V^HZ^HAT')$ | *strangeness* |
|$d$ | $r-s$ | *differential part* |
|$u$ | $n-r-a$ | *undetermined variables* |
|$v$ | $m-r-a-s$ | *vanishing equations* |

are invariant under local equivalence transformations and $(E, A)$ is locally equivalent to the canonical form


\begin{equation}
\left(\begin{bmatrix}
I_s & 0 & 0 & 0 \\
0 & I_d & 0 & 0 \\
0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0
\end{bmatrix},
\begin{bmatrix}
0 & 0 & 0 & 0  \\
0 & 0 & 0 & 0  \\
0 & 0 & I_a & 0 \\
I_s & 0 & 0 & 0 \\
0 & 0 & 0 & 0
\end{bmatrix}\right),
(\#eq:local-canonical-form)
\end{equation}
where all diagonal blocks are square, except maybe the last one.</div>\EndKnitrBlock{theorem}
Some remarks on the spaces and how the names are derived for the case $E\dot x = Ax +f$ with constant coefficients. The ideas are readily transferred to the case with time-varying coefficients. 

Let 
$$x(t) = Ty(t) + T'y'(t),$$

where $y$ denotes the components of $x$ that evolve in the range of $T$ and $y'$ the respective complement. (Since $[T|T']$ is a basis of $\mathbb C^{n}$, there exist such $y$ and $y'$ that uniquely define $x$ and vice versa). With $T$ spanning $\ker E$ we find that 

$$E \dot x(t) = ET\dot y(t) + ET'\dot y'(t)$$

so that the DAE basically reads

$$ET'\dot y'(t) = ATy(t) + AT'y'(t)+f,$$

i.e. the components of $x$ defined through $y$ are, effectively, not differentiated. With $Z$ containing exactly those $v$, for which $v^HE=0$, it follows that 

$$Z^HET'\dot y'(t) = 0 = Z^HATy(t) + Z^HAT'y'(t)+Z^Hf,$$

or 

$$Z^HATy(t) = -Z^HAT'y'(t)-Z^Hf,$$

so that $\rank Z^HAT$ indeed describes the number of purely algebraic equations and variables in the sense that it defines parts of $y$ (which is never going to be differentiated) in terms of algebraic relations (no time derivatives are involved).

With the same arguments and with $V=\corange Z^HAT$, it follows that 

$$V^HZ^HAT'y'(t) = -V^HZ^HATy(t) -V^HZ^Hf=-V^HZ^Hf,$$

is the part of $E\dot x = Ax + f$ in which those components $y'$ that are also differentiated are algebraically equated to a right-hand side. This is the *strangeness* (rather in the sense of *skewness*) of DAEs that variables can be both differential and algebraic. Accordingly, $\rank V^HZ^HAT'$ describes the size of the skewness component. 

> **Outlook**: If there is no strangeness, the DAE is called strangeness-free. Strangeness can be eliminated through iterated differentiation and substitution. The needed number of such iterations (that is independent of the the size $s$ of the *strange* block here) will define the strangeness index.


\BeginKnitrBlock{example}<div class="example"><span class="example" id="exm:strangeness-in-the-circuit"><strong>(\#exm:strangeness-in-the-circuit) </strong></span>With basic scalings and state transforms, one finds for the coefficients of Example \@ref(exm:the-circuit) that:
$$
(E, A) \backsim 
\left(
\begin{bmatrix} I_2 & 0 \\ 0 & 0 \end{bmatrix}
,
\begin{bmatrix} 0 & 0 \\ 0 & I_1 \end{bmatrix}
\right).
$$

We compute the subspaces as defined in \@ref(eq:lcf-subspaces):

| Matrix | as the basis of/computed as |
|:----------|:------------------------|
| $T=\begin{bmatrix} 0 \\ I_1 \end{bmatrix}$ | $\kernel\begin{bmatrix} I_2 & 0 \\ 0 & 0 \end{bmatrix}$ |
| $Z=\begin{bmatrix} 0 \\ I_1 \end{bmatrix}$ | $\corange\begin{bmatrix} I_2 & 0 \\ 0 & 0 \end{bmatrix}=\kernel\begin{bmatrix} I_2 & 0 \\ 0 & 0 \end{bmatrix}^H$ |
| $T'=\begin{bmatrix} I_2 \\ 0 \end{bmatrix}$ | $\cokernel\begin{bmatrix} I_2 & 0 \\ 0 & 0 \end{bmatrix}=\range\begin{bmatrix} I_2 & 0 \\ 0 & 0 \end{bmatrix}^H$ |
| $Z^HAT=I_1$ | $\begin{bmatrix} 0 \\ I_1 \end{bmatrix}^H\begin{bmatrix} 0 & 0 \\ 0 & I_1 \end{bmatrix}\begin{bmatrix} 0 \\ I_1 \end{bmatrix}$ |
| $V=0$ | $\corange (Z^HAT) = \kernel I_1^H\phantom{\begin{bmatrix} 0 \\ I_1 \end{bmatrix}}$ |
| $Z^HAT'=0_{2\times 1}$ | $\begin{bmatrix} 0 \\ I_1 \end{bmatrix}^H\begin{bmatrix} 0 & 0 \\ 0 & I_1 \end{bmatrix}\begin{bmatrix} I_2 \\ 0 \end{bmatrix}$ |

and derive the quantities as defined in \@ref(eq:lcf-quantities):

| Name | Value | Derived from |
|:-----|:------|--------------|
| rank | $r=2$ | $\rank E = \rank \begin{bmatrix} I_2 & 0 \\ 0 & 0 \end{bmatrix}$ |
| algebraic part | $a=1$ | $\rank Z^HAT = \rank I_1$ |
| strangeness | $s=0$ | $\rank V^HZ^HAT' = \rank 0_{2\times 1}$ |
| differential part | $d=2$ | $d=r-s=2-0$ |
| undetermined variables | $u=0$ | $u=n-r-a=3-2-1$ |
| vanishing equations | $v=0$ | $v=m-r-a-s=3-2-1-0$ |
</div>\EndKnitrBlock{example}

\BeginKnitrBlock{example}<div class="example"><span class="example" id="exm:strangeness-in-the-nse"><strong>(\#exm:strangeness-in-the-nse) </strong></span>With more involved scalings and state transforms, one finds for the coefficients of the linearized and spatially discretized Navier-Stokes equations (see Exercise I) that:
$$
(\mathcal E, \mathcal A) =
\left(
\begin{bmatrix} M & 0 \\ 0 & 0 \end{bmatrix}
,
\begin{bmatrix} A & B^H \\ B & 0 \end{bmatrix}
\right)
\backsim 
\left(
\begin{bmatrix} I_{n_1} & 0 & 0 \\ 0 & I_{n_2} & 0 \\ 0 & 0 & 0\end{bmatrix}
,
\begin{bmatrix} A_{11} & A_{12} & I_{n_1} \\ A_{21} & A_{22} & 0 \\ I_{n_1} & 0 & 0\end{bmatrix}
\right).
$$

We compute the subspaces as defined in \@ref(eq:lcf-subspaces):

| Matrix | as the basis of/computed as|
|:-----------|:--------------------------|
| $T=\begin{bmatrix} 0 \\ 0 \\I_{n_1} \end{bmatrix}$ | $\kernel \begin{bmatrix} I_{n_1} & 0 & 0 \\ 0 & I_{n_2} & 0 \\ 0 & 0 & 0\end{bmatrix}$ |
| $Z=\begin{bmatrix} 0 \\ 0 \\I_{n_1} \end{bmatrix}$ | $\corange \begin{bmatrix} I_{n_1} & 0 & 0 \\ 0 & I_{n_2} & 0 \\ 0 & 0 & 0\end{bmatrix}$ |
| $T'=\begin{bmatrix} I_{n_1} & 0 \\ 0 & I_{n_2} \\ 0 & 0 \end{bmatrix}$ | $\cokernel\begin{bmatrix} I_{n_1} & 0 & 0 \\ 0 & I_{n_2} & 0 \\ 0 & 0 & 0\end{bmatrix}$ |
| $Z^HAT=0_{n_1}$ | $\begin{bmatrix} 0 \\ 0 \\I_{n_1} \end{bmatrix}^H\begin{bmatrix} A_{11} & A_{12} & I_{n_1} \\ A_{21} & A_{22} & 0 \\ I_{n_1} & 0 & 0\end{bmatrix}\begin{bmatrix} 0 \\ 0 \\I_{n_1} \end{bmatrix}$ |
| $V=I_{n_1}$ | $\corange (Z^HAT) = \kernel 0_{n_1}^H\phantom{\begin{bmatrix} 0 \\ I_1 \end{bmatrix}}$ |
| $Z^HAT'=\begin{bmatrix} I_{n_1} & 0_{n_1\times n_2}\end{bmatrix}$ | $\begin{bmatrix} 0 \\ 0 \\I_{n_1} \end{bmatrix}^H\begin{bmatrix} A_{11} & A_{12} & I_{n_1} \\ A_{21} & A_{22} & 0 \\ I_{n_1} & 0 & 0\end{bmatrix}\begin{bmatrix} I_{n_1} & 0 \\ 0 & I_{n_2} \\ 0 & 0 \end{bmatrix}$ |

and derive the quantities as defined in \@ref(eq:lcf-quantities):

| Name | Value | Derived from |
|:-----------------|:------|----------------------------|
| rank | $r=n_1+n_2$ | $\rank E = \rank \begin{bmatrix} I_{n_1} & 0 & 0 \\ 0 & I_{n_2} & 0 \\ 0 & 0 & 0\end{bmatrix}$ |
| algebraic part | $a=0$ | $\rank Z^HAT = \rank 0_{n_1}$ |
| strangeness | $s=n_1$ | $\rank V^HZ^HAT' = \rank \begin{bmatrix} I_{n_1} & 0_{n_1\times n_2}\end{bmatrix}$ |
| differential part | $d=n_2$ | $d=r-s=(n_1 + n_2) - n_1$ |
| undetermined variables | $u=n_1$ | $u=n-r-a=(n_1+n_2+n_1)-(n_1+n_2)-0$ |
| vanishing equations | $v=0$ | $v=m-r-a-s=(n_1+n_2+n_1)-(n_1+n_2)-n_1$ |
</div>\EndKnitrBlock{example}

\BeginKnitrBlock{theorem}\iffalse{-91-115-101-101-32-75-117-110-107-101-108-47-77-101-104-114-109-97-110-110-44-32-84-104-109-46-32-51-46-57-93-}\fi{}<div class="theorem"><span class="theorem" id="thm:continuous-svd"><strong>(\#thm:continuous-svd)  \iffalse (see Kunkel/Mehrmann, Thm. 3.9) \fi{} </strong></span>
Let $E\in \mathcal C^l(I, \mathbb C^{m,n})$ with $\rank E(t)=r$ for all $t\in I$. Then there exist smooth and pointwise unitary (and, thus, nonsingular) matrix functions $U$ and $V$, such that 

$$
 U^HEV =
 \begin{bmatrix}
 \Sigma & 0 \\
 0 & 0
 \end{bmatrix}
$$
with pointwise nonsingular $\Sigma \in \mathcal C^l(I, \mathbb C^{r,r})$. </div>\EndKnitrBlock{theorem}

\BeginKnitrBlock{theorem}<div class="theorem"><span class="theorem" id="thm:global-canonical-form"><strong>(\#thm:global-canonical-form) </strong></span>
Let $E, A \in \mathcal C^l(I, \mathbb C^{m,n})$ be sufficiently smooth and suppose that 
\begin{equation}
	r(t) = r, \quad a(t)=a, \quad s(t)=s (\#eq:glob-local-char-vals)
\end{equation}

for the local characteristic values of $(E(t), A(t))$. Then $(E, A)$ is globally equivalent to the canonical form
\begin{equation}
\left(
\begin{bmatrix}
I_s &  0  & 0 & 0 \\
0   & I_d & 0 & 0 \\
0   &  0  & 0 & 0 \\
0   &  0  & 0 & 0 \\
0   &  0  & 0 & 0
\end{bmatrix}, 
\begin{bmatrix}
0   & A_{12}&  0  & A_{14} \\
0   &   0   &  0  & A_{24} \\
0   &   0   & I_a & 0 \\
I_s &   0   &  0  & 0 \\
0   &   0   &  0  & 0
\end{bmatrix}
\right ).
(\#eq:glob-can-form)
\end{equation}

All entries are again matrix functions on $I$ and the last block column in both matrix functions of \@ref(eq:glob-can-form) has size $u=n-s-d-a$.
</div>\EndKnitrBlock{theorem}

\BeginKnitrBlock{proof}<div class="proof">\iffalse{} <span class="proof"><em>Proof. </em></span>  \fi{}In what follows, we will tacitly redefine the block matrix entries that appear after the global equivalence transformations. The first step is the continous SVD of $E$; see Theorem \@ref(thm:global-canonical-form).
<!-- \begin{ofalltheseblockmats} -->
\begin{align*}
(E,A) & 
\sim   
\left(\begin{bmatrix}
\Sigma & 0 \\
0 & 0
\end{bmatrix},
\begin{bmatrix}
A_{11} & A_{12} \\
A_{21} & A_{22}
\end{bmatrix}\right) \\
%%%%%%%%%%%%%%%%%%%%%%%%%%
& \sim   
\left(\begin{bmatrix}
I_r & 0 \\
0 & 0
\end{bmatrix},
\begin{bmatrix}
A_{11} & A_{12} \\
A_{21} & A_{22}
\end{bmatrix}\right) \\
%%%%%%%%%%%%%%%%%%%%%%
& \sim   
\left(\begin{bmatrix}
I_r & 0 \\
0 & 0
\end{bmatrix},
\begin{bmatrix}
A_{11} & A_{12}V_1 \\
U_1^HA_{21} & U_1^HA_{22}V_1 
\end{bmatrix}
-
\begin{bmatrix} I_r & 0 \\ 0 & 0 \end{bmatrix}
\begin{bmatrix} 0 & 0 \\ 0 & \dot V_1 \end{bmatrix}
\right) \\
%%%%%%%%%%%%%%%%%%%%%%
& \sim   
\left(\begin{bmatrix}
I_r & 0 & 0 \\
0 & 0 & 0 \\
0 & 0 & 0
\end{bmatrix},
\begin{bmatrix}
A_{11} & A_{12} & A_{13}\\
A_{21} & I_a & 0 \\
A_{31} & 0  & 0
\end{bmatrix}\right) \\
%%%%%%%%%%%%%%%%%%%%%%
& \sim   
\left(\begin{bmatrix}
V_2 & 0 & 0 \\
0 & 0 & 0 \\
0 & 0 & 0
\end{bmatrix},
\begin{bmatrix}
A_{11}V_2 & A_{12} & A_{13}\\
A_{21}V_2 & I_a & 0 \\
U_2^HA_{31}V_2 & 0 & 0
\end{bmatrix}
-
\begin{bmatrix}
\dot I_r & 0 & 0 \\
0 & 0 & 0 \\
0 & 0 & 0
\end{bmatrix}
\begin{bmatrix}
\dot V_2 & 0 & 0 \\
0 & 0 & 0 \\
0 & 0 & 0
\end{bmatrix} \right)\\
%%%%%%%%%%%%%%%%%%%%%%
& \sim   
\left(\begin{bmatrix}
V_{11} & V_{12} & 0 & 0 \\
V_{21} & V_{22} & 0 & 0 \\
0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0
\end{bmatrix},
\begin{bmatrix}
A_{11} & A_{12} & A_{13} & A_{14}  \\
A_{21} & A_{22} & A_{23} & A_{24}  \\
A_{31} & A_{32} & I_a & 0 \\
I_s & 0 & 0 & 0 \\
0 & 0 & 0 & 0
\end{bmatrix} \right)\\
%%%%%%%%%%%%%%%%%%%%%%
& \sim   
\left(\begin{bmatrix}
I_s & 0 & 0 & 0 \\
0 & I_d & 0 & 0 \\
0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0
\end{bmatrix},
\begin{bmatrix}
0 & A_{12} & A_{13} & A_{14}  \\
0 & A_{22} & A_{23} & A_{24}  \\
0 & A_{32} & I_a & 0 \\
I_s & 0 & 0 & 0 \\
0 & 0 & 0 & 0
\end{bmatrix} 
\begin{bmatrix}
I_s & 0 & 0 & 0  \\
0 & I_d & 0 & 0  \\
0 & -A_{32} & I_a & 0 \\
I_s & 0 & 0 & I_a
\end{bmatrix} 
\right) \\
%%%%%%%%%%%%%%%%%
& \sim   
\left(\begin{bmatrix}
I_s & 0 & 0 & 0 \\
0 & I_d & 0 & 0 \\
0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0
\end{bmatrix},
\begin{bmatrix}
0 & A_{12} & A_{13} & A_{14}  \\
0 & A_{22} & A_{23} & A_{24}  \\
0 & 0 & I_a & 0 \\
I_s & 0 & 0 & 0 \\
0 & 0 & 0 & 0
\end{bmatrix}\right)\\
%%%%%%%%%%%%%%%%%
& \sim   
\left(\begin{bmatrix}
I_s & 0 & 0 & 0 \\
0 & I_d & 0 & 0 \\
0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0
\end{bmatrix},
\begin{bmatrix}
0 & A_{12} & 0 & A_{14}  \\
0 & A_{22} & 0 & A_{24}  \\
0 & 0 & I_a & 0 \\
I_s & 0 & 0 & 0 \\
0 & 0 & 0 & 0
\end{bmatrix}\right)\\
%%%%%%%%%%%%%%%%%
& \sim   
\left(\begin{bmatrix}
I_s & 0 & 0 & 0 \\
0 & Q_2 & 0 & 0 \\
0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0
\end{bmatrix},
\begin{bmatrix}
0 & A_{12}Q_2 & 0 & A_{14}  \\
0 & A_{22}Q_2-\dot Q_2 & 0 & A_{24}  \\
0 & 0 & I_a & 0 \\
I_s & 0 & 0 & 0 \\
0 & 0 & 0 & 0
\end{bmatrix}\right) \\
%%%%%%%%%%%%%%%%%
& \sim   
\left(\begin{bmatrix}
I_s & 0 & 0 & 0 \\
0 & I_d & 0 & 0 \\
0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0
\end{bmatrix},
\begin{bmatrix}
0 & A_{12} & 0 & A_{14}  \\
0 & 0 & 0 & A_{24}  \\
0 & 0 & I_a & 0 \\
I_s & 0 & 0 & 0 \\
0 & 0 & 0 & 0
\end{bmatrix}\right),
\end{align*}
<!-- \end{ofalltheseblockmats} -->
where the final equivalence holds, if $Q_2$ is chosen as the (unique and pointwise invertible) solution of the linear matrix valued ODE
$$
\dot Q_2 = A_{22}(t)Q_2 ,  \quad Q_2 (t_0 ) = I_d.
$$
Then, $A_{22}$ vanishes because of the special choice of $Q_2$ and $E_{22}$ becomes $I_d$ after scaling the second block line by $Q_2^{-1}$.</div>\EndKnitrBlock{proof}