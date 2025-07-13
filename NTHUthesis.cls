\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{NTHUthesis}[June, 2021 v1.0 Typesetting theses for members of National Tsing Hua University, Hsinchu, Taiwan]

\LoadClass[a4paper,12pt,twoside]{report}

% Required packages
% \RequirePackage[headheight=14pt,left=3cm,right=3cm,top=3cm,bottom=2.5cm]{geometry}
\RequirePackage[headheight=14pt,margin=1in]{geometry}
\RequirePackage{indentfirst}
\RequirePackage{setspace}
\RequirePackage{CJKutf8}
\RequirePackage{tocbibind}
\RequirePackage{hyperref}
\RequirePackage{tikz}
\RequirePackage[encoding=UTF8]{zhnumber}
\RequirePackage{eso-pic}

% Options
\DeclareOption{master}{\gdef\@degreeZH{碩}}
\DeclareOption{doctor}{\gdef\@degreeZH{博}}
\DeclareOption{nowatermark}{\gdef\nowatermark{1}}
\ProcessOptions\relax

% Watermark of NTHU
\ifdefined \nowatermark \else
    % \AtBeginShipout{
    %     \AtBeginShipoutAddToBox{
    %         \begin{tikzpicture}[overlay,remember picture]
    %         \node[opacity=0.5] at (current page.center){
    %             \includegraphics[height=163pt,width=202pt]{nthu-logo.pdf}
    %         };
    %         \end{tikzpicture}
    %     }
    % }  
    \AddToShipoutPictureBG{
        \begin{tikzpicture}[overlay,remember picture]
        \node[opacity=0.5] at (current page.center){
            \includegraphics[height=163pt,width=202pt]{nthu-logo.pdf}
        };
        \end{tikzpicture}
    }
\fi

% Default spacing
\setstretch{2}


% Declared variables
\newcommand{\titleZH}[1]{\gdef\@titleZH{#1}}
\newcommand{\titleEN}[1]{\gdef\@titleEN{#1}}
\newcommand{\instituteZH}[1]{\gdef\@instituteZH{#1}}
\newcommand{\studentID}[1]{\gdef\@studentID{#1}}
\newcommand{\studentZH}[1]{\gdef\@studentZH{#1}}
\newcommand{\studentEN}[1]{\gdef\@studentEN{#1}}
\newcommand{\advisorZH}[1]{\gdef\@advisorZH{#1}}
\newcommand{\advisorEN}[1]{\gdef\@advisorEN{#1}}
\newcommand{\yearZH}[1]{\gdef\@yearZH{#1}}
\newcommand{\monthZH}[1]{\gdef\@monthZH{#1}}

% Customized commands
\newcommand{\makecover}{
\begin{titlepage}
    % 為封面頁單獨添加浮水印
    \ifdefined \nowatermark \else
        \AddToShipoutPictureBG*{
            \begin{tikzpicture}[overlay,remember picture]
            \node[opacity=0.5] at (current page.center){
                \includegraphics[height=163pt,width=202pt]{nthu-logo.pdf}
            };
            \end{tikzpicture}
        }
    \fi
    \begin{center}
    \begin{CJK*}{UTF8}{bkai}
    \begin{spacing}{2.5}
        \Huge
        國~~立~~清~~華~~大~~學\\
        \@degreeZH~~士~~論~~文
    \end{spacing}
    \begin{spacing}{1.5}
    \LARGE
    \@titleZH\\
    \@titleEN
    \vfill
    \Large
    \begin{tabular}{l}
        所\hspace{1.2cm}別：\@instituteZH\\
        學\hspace{1.2cm}號：\@studentID\\
        研\hspace{0.3cm}究\hspace{0.3cm}生：\@studentZH~(\@studentEN)\\
        指導教授：\@advisorZH~(\@advisorEN)
    \end{tabular}\\
    \vspace{1.5\baselineskip}
    % 二〇二五~~年~~\zhdigits{\@monthZH}~~月\\
    中~~華~~民~~國~~\zhdigits{\@yearZH}~~年~~\zhdigits{\@monthZH}~~月\\
    February 2025\\
    \end{spacing}
    \end{CJK*}
    \end{center}
\end{titlepage}
}

% 做新的label %
% \usepackage{tocbasic}
% \DeclareNewTOC[%
%   type=map,
%   float,
%   name=Map,
%   listname={List of Maps},
%   ]{map}
% \renewcommand{\themap}{\thechapter.\arabic{map}}




% \newcommand{\maketoc}{
%     \tableofcontents
%     \clearpage
%     \thispagestyle{fancy}
%     \listoftables
%     \clearpage
%     \thispagestyle{fancy}
%     \newpage
%     \listoffigures
%     \clearpage
%     \thispagestyle{fancy}
%     \newpage
%     \addcontentsline{toc}{chapter}{List of Maps}
%     \listofmaps
%     \clearpage
%     \thispagestyle{fancy}
%     \newpage
% }

\newcommand{\maketoc}{%
    % 為保險起見，先換到新頁
    \clearpage
    
    % 目錄
    \tableofcontents
    \clearpage
    \thispagestyle{fancy}
    
    % List of Figures
    % \chapter*{List of Figures}
    \phantomsection
    % \addcontentsline{toc}{chapter}{List of Figures}
    \listoffigures
    \clearpage
    \thispagestyle{fancy}
        
    % List of Tables
    % \chapter*{List of Tables}  % 不想顯示章號，所以用 *
    \phantomsection            % 若用 hyperref, 需這行才能正確超連結
    % \addcontentsline{toc}{chapter}{List of Tables}
    \listoftables
    \clearpage
    \thispagestyle{fancy}
    
    % List of Maps
    % \chapter*{List of Maps}
    \phantomsection
    \addcontentsline{toc}{chapter}{List of Maps}
    \listofmaps
    \clearpage
    \thispagestyle{fancy}
}

\newcommand{\makeenv}[3]{
    \newenvironment{#1}{
        \phantomsection
        \section*{\centerline{#2}}
        \addcontentsline{toc}{chapter}{#3}
    }{
        \clearpage
    }
}

\newcommand{\makeenvZH}[3]{
    \newenvironment{#1}{
        \begin{CJK*}{UTF8}{bkai}
        \phantomsection
        \section*{\centerline{#2}}
        \addcontentsline{toc}{chapter}{#3}
    }{
        \clearpage
        \end{CJK*}
    }
}

% Customized environments
\makeenvZH{abstractZH}{摘要}{摘要}
\makeenvZH{acknowledgementsZH}{致謝}{Acknowledgements (Chinese)}
\makeenv{abstractSED}{Dungus Pnatis}{Dungus Pnatis}
\makeenv{abstractEN}{Abstract}{Abstract}
\makeenv{acknowledgementsEN}{Kari Snhuwe - Acknowledgements - 致謝辭}{Acknowledgements}
