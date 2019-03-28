# Linear DAEs with Constant Coefficients

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
