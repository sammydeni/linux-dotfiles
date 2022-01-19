# automatic setup of my Arch/EndeavourOS installation

alacritty_setup () {
echo "Do you want to install and Setup Alacritty?"
echo "1) Yes"
echo "2) No"
read -r -p "Type the number of the choise: " choise
case $choise in
    1 ) echo "Installing Alacritty"
        yay -S ttf-jetbrains-mono alacritty
        cp -r alacritty/ ~/.config/alacritty
        ;;
    2 ) echo "Skipping"
        ;;
    * ) echo "enter a valid choise!"
        alacritty_setup
esac    
}

vim_setup () {
echo "Do you want to install/configure Vim?"
echo "1) Yes"
echo "2) No"
read -r -p "Type the number of the choise: " choise
case $choise in
    1 ) echo "Installing Vim"
        yay -S vim 
        cp ./vim-config/.vim ~/
        cp ./vim-config/.vimrc ~/
        ;;
    2 ) echo "Skipping"
    ;;
    * ) echo "Enter a valid choise!"
    vim_setup
esac
}

zsh_setup () {
    echo "Do you want to configure ZSH/OhMyZsh?"
    echo "1) Yes"
    echo "2) No"
    read -r -p "Type the number of the choise: " choise
    case $choise in
    1 ) echo "Installing Zsh"
        sudo pacman -S zsh
        cp ./.zshrc ~/
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
        echo ""
        ;;
    2 ) echo "Skipping"
    ;;
    * ) echo "Enter a valid choise!"
    zsh_setup
esac
}

app_setup () {
    echo "Installing the Apps"
    yay -S visual-studio-code-bin android-studio brave-bin telegram-desktop
    echo "Installing Flutter"
    cd ~
    mkdir development
    cd development
    git clone https://github.com/flutter/flutter.git -b stable
    export PATH="$PATH:/home/sam/development/bin"
}

setup () {
        clear
        echo "What do you want to do?"
        echo "1) Setup Alacritty"
        echo "2) Setup Vim"
        echo "3) Setup Zsh and OhMyZsh"
        echo "4) Install the Development Apps"
        read -r -p "Type the number of the choise: " choise
        case $choise in
            1 ) alacritty_setup
                setup
                break
                ;;
            2 ) vim_setup
                setup
                ;;
            3 ) zsh_setup
                setup

                ;;
            4 ) app_setup
                setup

                ;;
            * ) echo "Enter a valid choise!"
            setup
        esac
}

# start the installation script
setup