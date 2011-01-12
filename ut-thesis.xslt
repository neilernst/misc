<?xml version="1.0" encoding="utf-8"?>
	
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:html="http://www.w3.org/1999/xhtml"
    version="1.0">
  
  <xsl:import href="xhtml2latex.xslt"/>
  
  <xsl:template match="/">
    <xsl:apply-templates select="html:html/html:head"/>
    <xsl:apply-templates select="html:html/html:body"/>
    <xsl:call-template name="latex-footer"/>
  </xsl:template>

  <xsl:template name="latex-footer">
    <xsl:text>
	% Back Matter
	%

	%\backmatter
	%\appendixpage

	%	Bibliography
	\bibliographystyle{\mybibliostyle}
	\bibliocommand

	%	Glossary
	%\printglossaries
	%\addcontentsline{toc}{chapter}{Glossary}

	%	Index
	%\printindex

	\end{document}
    </xsl:text>
  </xsl:template>
	
  <xsl:template name="latex-intro">
    <xsl:text></xsl:text>
  </xsl:template>

  <xsl:template name="latex-document-class">
    <xsl:text>
	%!TEX TS-program = xelatex
	%!TEX encoding = UTF-8 Unicode
	\documentclass[10pt,oneside]{ut-thesis} %draft
	% Allow for color (annotations)
    </xsl:text>
  </xsl:template>

  <xsl:template name="latex-paper-size">
    <xsl:text>%%% need more space for ToC page numbers</xsl:text>
  </xsl:template>
	
  <xsl:template name="latex-header">
    <xsl:text>

	%\usepackage{fontspec}
	%\usepackage{xunicode}
	%\usepackage{xltxtra}
	\usepackage{layouts}[2001/04/29]
	\makeindex
	\usepackage[square,authoryear]{natbib}
	\usepackage[colorinlistoftodos,shadow]{todonotes} %obeyDraft,disable
	\usepackage{algorithmic,algorithm}
	\newtheorem{mydef}{Definition}
	\usepackage{graphicx}
	\newcommand{\slbl}[1]{\textbf{\textsf{#1}}}
	\usepackage{multirow}
	%\usepackage{glossaries}
	
	%\makeglossaries
	\usepackage{epigraph}
	%\setcitestyle{}
	%\usepackage{color}
	\usepackage{changepage}
	\usepackage{graphicx}			% To include graphics in pdf's (jpg, gif, png, etc)
	\usepackage{booktabs,colortbl,slashbox}			% Better tables
	\usepackage{tabulary}			% Support longer table cells
	%\usepackage[utf8]{inputenc}		% For UTF-8 support
	%\usepackage[T1]{fontenc}		% Use T1 font encoding for accented characters
	\usepackage{xcolor}
	\usepackage[draft=false,citebordercolor=white]{hyperref}
	%\defaultfontfeatures{Mapping=tex-text}
	%\setmainfont{Times New Roman}

        \usepackage{amssymb}
        \newtheorem{thm}{Theorem}[section]
        \newtheorem{example}[thm]{Example}

	% custom defs for Techne notation
	\newcommand{\ppe}[2]{$#1 \xrightarrow{++} #2$}
	\newcommand{\pe}[2]{$#1 \xrightarrow{+} #2$}
	\newcommand{\nne}[2]{$#1 \xrightarrow{--} #2$}
	\newcommand{\nege}[2]{$#1 \xrightarrow{-} #2$}
	\newcommand{\ande}[2]{$#1 \xrightarrow{AND} #2$}
	\newcommand{\ore}[2]{$#1 \xrightarrow{OR} #2$}
	\newcommand{\inode}[2]{$#1 \xrightarrow{I} #2$}
	\newcommand{\cnode}[2]{$#1 \xrightarrow{C} #2$}
	\newcommand{\tuple}[1]{\ensuremath{\left \langle \mathit{#1} \right \rangle }}
	\newcommand{\nc}{\,\mid\!\sim\,} % non-monotonic consequence
	\newcommand{\rekb}{$\mathsf{REKB}$}
        \newcommand{\context}{explanation}
        \newcommand{\eendex}{$\blacksquare$} %amssymb

	\def\IS{software}
        \newcommand{\ab}[1]{{\textcolor{red}{ ALEXB: \textit{#1}}}}
        %\newcommand{\ab}[1]{{\todo[inline]{ALEXB: #1}}}
        %\newcommand{\ab}[1]{}
        \newcommand{\comment}[1]{}
        \newcommand{\typeSet}[1]{ {\mbox{$\wp$}(#1)} } %NE done -> need to explain first occurrence
        %\newcommand{\typeSet}[1]{ {\mbox{Set}(#1)} }
        %%%
        \newcommand{\xb}[1]{\textbf{#1}}
        \newcommand{\xf}[1]{\textsf{#1}}
        \newcommand{\xc}[1]{\textsc{#1}}
        \newcommand{\xt}[1]{\texttt{#1}}
        \newcommand{\mand}{\xf{\tiny{\xb{M}}}}
        \newcommand{\opt}{\xf{\tiny{\xb{O}}}}

        \newcommand{\makesc}[1]{{\mbox{{\sc #1}}}}

        \def\rekbsf{\mbox{{\textsc{rekb}}}}
        \def\rekb{\mbox{{\textsc{rekb}}}}
        \def\rekbst{\mbox{\rekb.ST}} %the symbol table
        \def\rekbth{\mbox{\rekb.TH}} 
        \def\SORT{\mbox{{\sc sort}}}
        \def\GOAL{\mbox{{\sc goal}}}
        \def\TASK{\mbox{{\sc task}}}
        \def\DA{\mbox{{\sc da}}}
        \def\ATOM{\mbox{{\sc atom}}}
        \def\LABEL{\mbox{{\sc label}}}
	
        \newenvironment{defn}{~\\\indent\ignorespaces}{\eendex\\\par\noindent\ignorespacesafterend}


	%input glossary defs
	%\input{/Users/nernst/Dropbox/research/thesis/dissertation/glossary-defs.tex}
    </xsl:text>
  </xsl:template>

  <xsl:template name="latex-title">
    <xsl:text>%\chapterstyle{\mychapterstyle}
    %\pagestyle{\mypagestyle}

    %
    %		Front Matter
    %

    %\frontmatter

    \degree{Doctor of Philosophy}
    \department{Computer Science}
    \gradyear{2112}
    \author{Neil Alexander Ernst}
    \title{\mytitle}
    % Title Page
    \begin{document}
    \begin{preliminary}
    \maketitle
    \clearpage
    </xsl:text>
  </xsl:template>

  <xsl:template name="latex-copyright">
    <xsl:text>% Copyright Page</xsl:text>
  </xsl:template>

  <!-- support for abstracts -->
	
  <xsl:template match="html:h2[1][translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
                       'abcdefghijklmnopqrstuvwxyz') = 'abstract']">
    <xsl:text>\begin{abstract}</xsl:text>
    <xsl:value-of select="$newline"/>
    <!-- Get rid of auto labels.	<xsl:text>\label{</xsl:text>
         <xsl:value-of select="@id"/>
         <xsl:text>}</xsl:text> -->
    <xsl:value-of select="$newline"/>
    <xsl:text>\addcontentsline{toc}{chapter}{</xsl:text>
    <xsl:apply-templates select="node()"/>
    <xsl:text>}</xsl:text>
    <xsl:value-of select="$newline"/>
    <xsl:value-of select="$newline"/>
  </xsl:template>
  
  <xsl:template match="html:h2[position()='2'][preceding-sibling::html:h2[position()='1'][translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
                       'abcdefghijklmnopqrstuvwxyz') = 'abstract']]">
    <xsl:text>\end{abstract}\end{preliminary}</xsl:text>
    <xsl:value-of select="$newline"/>
    <xsl:value-of select="$newline"/>
    <xsl:choose>
      <xsl:when test="substring(node(), (string-length(node()) - string-length('*')) + 1) = '*'">
        <xsl:text>\chapter*{}</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>\chapter{</xsl:text>
        <xsl:apply-templates select="node()"/>
        <xsl:text>}</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:value-of select="$newline"/>
    <!-- Get rid of auto labels.	<xsl:text>\label{</xsl:text>
         <xsl:value-of select="@id"/>
         <xsl:text>}</xsl:text> -->
    <xsl:value-of select="$newline"/>
    <xsl:value-of select="$newline"/>
  </xsl:template>

  <xsl:template name="latex-begin-body">

    <xsl:text>% Table of Contents
    %todos
    \listoftodos
    \tableofcontents
    \listoffigures			% activate to include a List of Figures
    \listoftables			% activate to include a List of Tables

    %
    % Main Content
    %
    % Layout settings
    \setlength{\parindent}{1em}
    %\mainmatter
    </xsl:text>
  </xsl:template>

  <!-- Rename Bibliography -->
  <xsl:template name="rename-bibliography">
    <xsl:param name="source" />
    <xsl:text>\renewcommand\bibname{</xsl:text>
    <xsl:value-of select="$source" />
    <xsl:text>}
    </xsl:text>
  </xsl:template>

  <!-- Convert headers into chapters, etc -->
  
  <xsl:template match="html:h1">
    <xsl:choose>
      <xsl:when test="substring(node(), (string-length(node()) - string-length('*')) + 1) = '*'">
        <xsl:text>\part*{}</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>\part{</xsl:text>
        <xsl:apply-templates select="node()"/>
        <xsl:text>}</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:value-of select="$newline"/>
    <!-- Get rid of auto labels.	<xsl:text>\label{</xsl:text>
         <xsl:value-of select="@id"/>
         <xsl:text>}</xsl:text> -->
    <xsl:value-of select="$newline"/>
    <xsl:value-of select="$newline"/>
  </xsl:template>

  <xsl:template match="html:h2">
    <xsl:choose>
      <xsl:when test="substring(node(), (string-length(node()) - string-length('*')) + 1) = '*'">
        <xsl:text>\chapter*{}</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>\chapter{</xsl:text>
        <xsl:apply-templates select="node()"/>
        <xsl:text>}</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:value-of select="$newline"/>
    <!-- Get rid of auto labels.	<xsl:text>\label{</xsl:text>
         <xsl:value-of select="@id"/>
         <xsl:text>}</xsl:text> -->
    <xsl:value-of select="$newline"/>
    <xsl:value-of select="$newline"/>
  </xsl:template>

  <xsl:template match="html:h3">
    <xsl:text>\section{</xsl:text>
    <xsl:apply-templates select="node()"/>
    <xsl:text>}</xsl:text>
    <xsl:value-of select="$newline"/>
    <!-- Get rid of auto labels.	<xsl:text>\label{</xsl:text>
         <xsl:value-of select="@id"/>
         <xsl:text>}</xsl:text> 
    <xsl:value-of select="$newline"/>
    <xsl:value-of select="$newline"/>-->
  </xsl:template>

  <xsl:template match="html:h4">
    <xsl:text>\subsection{</xsl:text>
    <xsl:apply-templates select="node()"/>
    <xsl:text>}</xsl:text>
    <xsl:value-of select="$newline"/>
    <!-- Get rid of auto labels.	<xsl:text>\label{</xsl:text>
         <xsl:value-of select="@id"/>
         <xsl:text>}</xsl:text> -->
    <xsl:value-of select="$newline"/>
    <xsl:value-of select="$newline"/>
  </xsl:template>

  <!-- horizontal rule -->
  <xsl:template match="html:hr">
    <xsl:text>\begin{center}
      * * * * 
      \end{center}</xsl:text>
  </xsl:template>

  <xsl:template match="html:h5">
    <xsl:text>\subsubsection{</xsl:text>
    <xsl:apply-templates select="node()"/>
    <xsl:text>}</xsl:text>
    <xsl:value-of select="$newline"/>
    <!-- Get rid of auto labels.	<xsl:text>\label{</xsl:text>
         <xsl:value-of select="@id"/>
         <xsl:text>}</xsl:text> -->
    <xsl:value-of select="$newline"/>
    <xsl:value-of select="$newline"/>
  </xsl:template>

  <xsl:template match="html:h6">
    <xsl:text>{\itshape </xsl:text>
    <xsl:apply-templates select="node()"/>
    <xsl:text>}</xsl:text>
    <xsl:value-of select="$newline"/>
    <!-- Get rid of auto labels.	<xsl:text>\label{</xsl:text>
         <xsl:value-of select="@id"/>
         <xsl:text>}</xsl:text> -->
    <xsl:value-of select="$newline"/>
    <xsl:value-of select="$newline"/>
  </xsl:template>

  <!-- add support for Appendices - include a part or chapter named 'Appendices' to trigger-->
  
  <xsl:template match="html:h2[translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
                       'abcdefghijklmnopqrstuvwxyz') = 'appendices']">
    <xsl:text>\appendixpage*
    \appendix</xsl:text>
    <xsl:value-of select="$newline"/>
    <xsl:value-of select="$newline"/>
  </xsl:template>

  <xsl:template match="html:h1[translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
                       'abcdefghijklmnopqrstuvwxyz') = 'appendices']">
    <xsl:text>\appendixpage*
    \appendix</xsl:text>
    <xsl:value-of select="$newline"/>
    <xsl:value-of select="$newline"/>
  </xsl:template>

  <xsl:template match="html:h3[count(preceding-sibling::html:h2) = '1'][preceding-sibling::html:h2[position()='1'][translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
                       'abcdefghijklmnopqrstuvwxyz') = 'abstract']]">
    <xsl:text>\section*{</xsl:text>
    <xsl:apply-templates select="node()"/>
    <xsl:text>}</xsl:text>
    <xsl:value-of select="$newline"/>
    <!-- Get rid of auto labels.	<xsl:text>\label{</xsl:text>
         <xsl:value-of select="@id"/>
         <xsl:text>}</xsl:text> -->
    <xsl:value-of select="$newline"/>
    <xsl:value-of select="$newline"/>
  </xsl:template>

<xsl:template match="html:h4[count(preceding-sibling::html:h2) = '1'][preceding-sibling::html:h2[position()='1'][translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
                     'abcdefghijklmnopqrstuvwxyz') = 'abstract']]">
  <xsl:text>\subsection*{</xsl:text>
  <xsl:apply-templates select="node()"/>
  <xsl:text>}</xsl:text>
  <xsl:value-of select="$newline"/>
  <!-- Get rid of auto labels.	<xsl:text>\label{</xsl:text>
       <xsl:value-of select="@id"/>
       <xsl:text>}</xsl:text> -->
  <xsl:value-of select="$newline"/>
  <xsl:value-of select="$newline"/>
</xsl:template>

<!-- code block -->
<xsl:template match="html:pre[child::html:code]">
  <xsl:text>\begin{adjustwidth}{2.5em}{2.5em}
  \begin{verbatim}</xsl:text>
  <xsl:value-of select="./html:code"/>
  <xsl:text>\end{verbatim}
\end{adjustwidth}</xsl:text>
</xsl:template>

<!-- no code, so treat as poetry -->
<xsl:template match="html:pre">
  <xsl:text>\begin{adjustwidth}{4em}{4em}
  \setverbatimfont{\normalfont}
  \begin{verbatim}
  </xsl:text>
  <xsl:value-of select="."/>
  <xsl:text>
    \end{verbatim}
    \end{adjustwidth}
  </xsl:text>
</xsl:template>

<!-- epigraph (a blockquote immediately following a header 1-3) -->
<xsl:template match="html:blockquote[preceding-sibling::*[1][local-name() = 'h1' or local-name() = 'h2' or local-name() = 'h2' or local-name() = 'h3' ]]">
  <xsl:text>\epigraph{</xsl:text>
  <xsl:apply-templates select="node()"/>
  <xsl:text>}</xsl:text>
</xsl:template>

<!-- epigraph author (a blockquote within blockquote) -->
<xsl:template match="html:blockquote[last()][parent::*[preceding-sibling::*[1][local-name() = 'h1' or local-name() = 'h2' or local-name() = 'h2' or local-name() = 'h3']]] ">
  <xsl:text>}{</xsl:text>
  <xsl:apply-templates select="node()"/>
</xsl:template>

<!-- Memoir handles glossaries differently -->
<xsl:template match="html:li" mode="glossary">
  <xsl:param name="footnoteId"/>
  <xsl:if test="parent::html:ol/parent::html:div/@class = 'footnotes'">
    <xsl:if test="concat('#',@id) = $footnoteId">
      <xsl:apply-templates select="html:span[@class='glossary sort']" mode="glossary"/>
      <xsl:apply-templates select="html:span[@class='glossary name']" mode="glossary"/>
      <xsl:text>{</xsl:text>
      <xsl:apply-templates select="html:p" mode="glossary"/>
      <xsl:text>}</xsl:text>
    </xsl:if>
  </xsl:if>
</xsl:template>

<xsl:template match="html:span[@class='glossary name']" mode="glossary">
  <xsl:text>{</xsl:text>
  <xsl:apply-templates select="node()"/>
  <xsl:text>}</xsl:text>
</xsl:template>
	
<xsl:template match="html:span[@class='glossary sort']" mode="glossary">
  <xsl:text>(</xsl:text>
  <xsl:apply-templates select="node()"/>
  <xsl:text>)</xsl:text>
</xsl:template>

</xsl:stylesheet>
