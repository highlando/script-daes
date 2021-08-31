# Basic Definitions and Notions

In a very general form, a DAE can be written as

\begin{equation}
    F(t, x(t), \dot x(t)) = 0
   	(\#eq:gendae)
\end{equation}

with $F\colon \mathcal I \times D_x \times D_{\dot x} \to \mathbb R^m$ and with a time interval $\mathcal I=[t_0,t_e) \subset \mathbb R$ and state spaces $D_x$, $D_{\dot x} \subset \mathbb R^{n}$ and the task to find a function 

\begin{equation*}
    x \colon \mathcal I \to \mathbb R^{n}
\end{equation*}

with time derivative $\dot x \colon \mathcal I \to \mathbb R^{n}$ such that \@ref(eq:gendae) is fulfilled for all $t\in \mathcal I$.

A dynamical process that evolves in time needs an initial state. Thus, one can expect a unique solution to the DAEs only if an initial value is prescribed 

\begin{equation}
    x(t_0) = x_0 \in \mathbb R^{n}. (\#eq:gendaeiniv) 
\end{equation}

<div class="JHSAYS">
<p>The form of <span class="math inline">\(F(t, x(t), \dot x(t))\)</span> is a very formal way to write down a system of differential and algebraic equations. <strong>X</strong>: Write down the equations of the previous examples in this form – i.e. define suitable functions <span class="math inline">\(F\)</span>, <span class="math inline">\(x\)</span>, and <span class="math inline">\(\dot x\)</span>.</p>
</div>

## Solution Concept

In order to talk of solutions, we need to define what we understand as a solution.  


\BeginKnitrBlock{definition}<div class="definition"><span class="definition" id="def:dae-solution"><strong>(\#def:dae-solution) </strong></span>$\quad$

 1. A function $x \in \mathcal C^1(\mathcal I, \mathbb R^{n})$ is called a *solution to the DAE* \@ref(eq:gendae), if $F(t, x(t), \dot x(t)) = 0$ holds for all $t\in \mathcal I$.

 2. A function $x \in \mathcal C^1(\mathcal I, \mathbb R^{n})$ is called a *solution to the initial value problem* \@ref(eq:gendae) and \@ref(eq:gendaeiniv), if, furthermore,  $x(t_0)= x_0$ holds.

 3. An initial condition \@ref(eq:gendaeiniv) is called consistent for the DAE \@ref(eq:gendae), if there exists at least one solution as defined in 2.
</div>\EndKnitrBlock{definition}

Some remarks

 * The requirement that $x \in \mathcal C^1$ could be relaxed. Compare Example \@ref(exm:nonsmooth-sols), where certain components of the solution where smoother than others.
 * Consistency of initial values is a major issue in the treatment of DAEs. See the pendulum...

## Initial Conditions and Consistency

We consider again the equations of motions of the pendulum (Example \@ref(exm:the-pendulum))

\begin{align*}
	\dot x(t) &= u(t) \\
	\dot y(t) &= v(t) \\
	m \dot u(t) &= - 2 \lambda(t) (x(t) - c_x) \\ 
	m \dot v(t) &= - 2 \lambda(t) (y(t) - c_y) - mgy(t)
\end{align*}

with the constraint 

\begin{equation}
	0=(x(t) - c_x)^2 + (y(t) - c_y)^2 - l^2. (\#eq:pendulum-rvst-cnstrt)
\end{equation}

To use this model to predict the time evolution of the system, a starting point needs to be known, say for $t=0$. This means initial positions and initial velocities:

$$
\begin{bmatrix} 
x(0) \\ y(0)
\end{bmatrix}
=
\begin{bmatrix} 
	x_0 \\ y_0
\end{bmatrix}
\quad\text{and}\quad
\begin{bmatrix} 
u(0) \\ v(0)
\end{bmatrix}
=
\begin{bmatrix} 
	u_0 \\ v_0
\end{bmatrix}.
$$

The constraint \@ref(eq:pendulum-rvst-cnstrt) needs to be fulfilled at all times and also at $t=0$, which gives the constraint for the initial positions:

\begin{equation*}
	(x_0 - c_x)^2 + (y_0 - c_y)^2 - l^2=0.
\end{equation*}

Moreover, if a constraint $h(x(t), y(t))=0$ holds for all $t$, then, necessarily, $\frac{d}{dt}h=0$. For the pendulum this means that 

\begin{equation}
	2(x(t) - c_x)u(t) + 2(y(t) - c_y)v(t) = 0 (\#eq:pendulum-rvst-cnstrt-ddt)
\end{equation}

must hold for all $t$ and in particular at $t=0$ which gives constraints on the initial velocities $u_0$ and $v_0$:

\begin{equation*}
	2(x_0 - c_x)u_0 + 2(y_0 - c_y)v_0 = 0.
\end{equation*}

Some remarks on consistency, constraints, and derivations:

 * The so-called *consistency conditions* on $(x_0, y_0, u_0, v_0)$ have the physical interpretation that the initial positions lie on the prescribed circle and that the velocities are tangent to this circle.
 * One can show that the variable $\lambda$ is completely defined in terms of $x$ and $y$ and their derivatives. Thus, in the formulation \@ref(eq:pendulum), both in the analysis and in the numerical treatment, there is no need for an initial value for $\lambda$. However, as we will see, DAEs can be reformulated as ODEs through differentiation and substitutions. In such an ODE formulation, a necessary initial condition for $\lambda$ will have to fulfill similar consistency conditions as $(x_0, y_0, u_0, v_0)$.

Condition \@ref(eq:pendulum-rvst-cnstrt-ddt) is an example for a *hidden-constraint* -- an algebraic constraint to the system that is not explicit in the original formulation. In theory, condition \@ref(eq:pendulum-rvst-cnstrt) can be replaced by \@ref(eq:pendulum-rvst-cnstrt-ddt). Moreover, through differentiation and elimination of constraints, a DAE can be brought into the form of an ODE: in the case of the circuit of Example \@ref(exm:the-circuit) one only needs to replace the constraints by their derivatives:

\begin{equation}
\begin{split}
C(\dot x_3 - \dot x_2) &= - \frac{x_1 - x_2}{R} \\
\dot x_1 - \dot x_3 &= \dot U \\
\dot x_3 &= 0. 
\end{split}
(\#eq:circuit-ddt)
\end{equation}

Note that \@ref(eq:circuit-ddt) can be written as $B\dot x = Ax + f$ with an invertible matrix $B$ and, thus, is an ODE. 

For an ODE there is no constraint on the initial values. However, a solution to \@ref(eq:circuit-ddt) only solves the original DAE \@ref(eq:circuit), if the initial values are consistent with the DAE. In this case, this means $x_3(t_0)=0$ and $x_1(t_0) - x_3(t_0) = U(t_0)$.

## Additional Remarks

 * It just took a single derivation to turn the circuit model into an ODE \@ref(eq:circuit-ddt). For the *pendulum* this wouldn't be that easy.

 * The extend of how much algebraic and differential parts are intertwined is measured by *indices* which is **the classifier** for DAEs. 

 * There are many indices. We will learn about some of the concepts. But first we will introduce some more theory.

<div class="JHSAYS">
<p>A low index means that differential and algebraic parts are relatively well separated. (The circuit example is of <em>index 1</em>). A high index means that the structure is more involved. (The pendulum is of <em>index 3</em>).</p>
</div>


