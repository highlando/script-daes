# Examples 

## Semi-discrete Navier-Stokes equations

### Transformation to a more handy form

By scalings and state transforms, we find that the coefficients of the spatially discretized Navier-Stokes equations 
$$
(\mathcal E, \mathcal A )= \left(
\begin{bmatrix} M & 0 \\ 0 & 0 \end{bmatrix}
,
\begin{bmatrix} A & B^H \\ B & 0 \end{bmatrix}
\right )
$$
are equivalent to a more structured form like:
\begin{align*}
\{\lambda \mathcal E - \mathcal A\} &=
\left\{\lambda 
\begin{bmatrix} M & 0 \\ 0 & 0 \end{bmatrix}
-
\begin{bmatrix} A & B^H \\ B & 0 \end{bmatrix}
\right\} \\
& \backsim 
\begin{bmatrix} M^{-1/2} & 0 \\ 0 & I \end{bmatrix}
\left\{\lambda
\begin{bmatrix} M & 0 \\ 0 & 0 \end{bmatrix}
-
\begin{bmatrix} A & B^H \\ B & 0 \end{bmatrix}
\right\} 
\begin{bmatrix} M^{-1/2} & 0 \\ 0 & I \end{bmatrix} \\
& \backsim 
\begin{bmatrix} Q^H & 0 \\ 0 & I \end{bmatrix}
\left\{\lambda 
\begin{bmatrix} I & 0 \\ 0 & 0 \end{bmatrix}
-
\begin{bmatrix} M^{-1/2}AM^{-1/2} &  M^{-1/2}B^H \\ B M^{-1/2} & 0 \end{bmatrix}
\right\}
\begin{bmatrix} Q & 0 \\ 0 & I \end{bmatrix} \\
& \backsim 
\begin{bmatrix} I & 0 \\ 0 & R^{-H} \end{bmatrix}
\left\{ \lambda
\begin{bmatrix} I & 0 \\ 0 & 0 \end{bmatrix}
-
\begin{bmatrix} M^{-1/2}AM^{-1/2} &  \begin{bmatrix} R \\ 0 \end{bmatrix} \\ \begin{bmatrix}R^H & 0\end{bmatrix} & 0 \end{bmatrix}
\right \}
  \begin{bmatrix} I & 0 \\ 0 & R^{-1} \end{bmatrix} \\
& \quad =
\left\{\lambda
\begin{bmatrix} I_{n_1} & 0 & 0 \\ 0 & I_{n_2} & 0 \\ 0 & 0 & 0\end{bmatrix}
-
\begin{bmatrix} A_{11} & A_{12} & I_{n_1} \\ A_{21} & A_{22} & 0 \\ I_{n_1} & 0 & 0\end{bmatrix}
\right\}.
\end{align*}
where we have used a *QR*-decomposition: $$M^{-1/2}B^H=Q\begin{bmatrix}R \\ 0\end{bmatrix}$$ with unitary $Q$ and invertible $R$ in the third step.

### Local Characteristic Values {#x-nse-local-char-vals}

Next we derive the local characteristic as in Theorem \@ref(thm:local-canonical-form).

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

