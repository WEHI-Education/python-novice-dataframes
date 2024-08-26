#!/bin/bash

# Check if dpkg is installed
if command -v dpkg &>/dev/null; then
    # Check if nbgrader is available on the PATH
    if command -v nbgrader &>/dev/null; then
        echo "nbgrader found, installing and enabling extensions..."
        nb_version=$(pip show nbgrader | grep Version | awk '{print $2}')
        
        # Use dpkg's version comparison
        if dpkg --compare-versions "$nb_version" "gt" "0.8.5"; then
            echo "nbgrader version $nb_version > 0.8.5, activate notebook extensions via jupyter-labextension."
            # Enable nbgrader lab extension
            jupyter labextension enable nbgrader
        else
            echo "nbgrader version: $nb_version"

            # Install nbgrader extension
            jupyter nbextension install --sys-prefix --py nbgrader
            
            # Enable nbgrader extension
            jupyter nbextension enable --sys-prefix --py nbgrader
            
            # Enable nbgrader lab extension
            jupyter labextension enable nbgrader
            
            echo "nbgrader extensions installed and enabled."
        fi
    else
        echo "nbgrader not found on the PATH. Please install nbgrader first."
    fi
else
    echo "dpkg is not installed. Please install dpkg to perform version comparison."
fi


