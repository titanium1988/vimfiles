set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
"侦测文件类型
filetype on
filetype plugin on
filetype plugin indent on

" 跳过起始页 --- 关于索马里的那个页面·
set shortmess=atI

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"=============以下为gVim的常用设置选项=============
"编码设置
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
if has("win32")
	set fileencoding=chinese
else
	set fileencoding=utf-8
endif
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决console输出乱码
language messages zh_CN.utf-8

syntax on

"自动缩进、智能缩进
"set ai
"set si

"自动缩进
set autoindent

"处理为保存或只读文件时弹出确认框
set confirm
"记录history中的记录行数
set history=400

"当文件在外部被修改时，自动重新读取
set autoread

"高亮当前行
setlocal cursorline

set number
set background=dark

"调整窗口的尺寸及位置
winpos 150 20
set lines=28 columns=120
"状态栏
set laststatus=2  "总是显示

"设置制表符
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set cindent shiftwidth=4
set autoindent shiftwidth=4
"主题色
color molokai
let g:molokai_original=1

"若设置字体时，字体名中有空格存在，则需要用在空格前加转义字符；多种字体之间则用冒号或者使用双引号括起来
"例如：set guifont=Bitstream\ Vera\ Sans\ Mono:Yahei\ Consolas\ Hybrid:h12 
set guifont=Yahei_Consolas_Hybrid:h11:cGB2312

"设置工程Tags，这里以flight为例子,今后的工程得靠自己手动添加（暂且的解决方案）
"这里写点关于Ctag的东西,目前Ctag的新版本为5.8，下载链接：http://ctags.sourceforge.net/
"将Ctag.exe放到System32目录下，接着CMD中进入到项目所在的根目录中运行命令ctag -R  (大写R)，此时会生成一个包含变量和函数的列表文件，配置完成后重启VIM
"ctrl + ] 跳转到定义，Ctrl + T 跳转回定义
set tags+=C:\www\WorkSpace\flight

"对NERD_commenter设置
"如果安装成功后应该在菜单中看到plugin选项中有Comment，其中便会有各种样式的注释方式,比如连续点击 '\'+'c'+'c'则为单行注释
"以下为键值映射
map <leader>cc, c<space>
map <leader>cs, cs
map <leader>c$, c$
map <leader>cu, cu

"将NerdTree的启动映射到Fi和s可以水平分割或纵向分割窗口打开文件，前面加g类似go的功能
"以下为常用的快捷键
"t 在标签页中打开
"T 在后台标签页中打开
"p 到上层目录
"P 到根目录
"K 到同目录第一个节点
"J 到同目录最后一个节点
"m 显示文件系统菜单（添加、删除、移动操作）
"? 帮助
"q 关闭3
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

"php 代码自动补全  快捷键 Ctrl+X+O
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"其他语言的注释
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

"不要备份文件（根据自己需要取舍）
set nobackup

"不要生成swap文件，当buffer被丢弃的时候隐藏它
"setlocal noswapfile
