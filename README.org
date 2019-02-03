mCRL2 Spacemacs Layer
=========================

This is a Spacemacs layer for mCRL2 which provides syntax highlighting, and a reasonable integration of the mCRL2 toolset via Spacemacs bindings.



Key Bindings and Commands
=========================

| Key                | Function                                                                        |
|--------------------|---------------------------------------------------------------------------------|
| <kbd>SPC b l 1</kbd> | Create a Linear Process Spec. based off of current buffer using Reg.
| <kbd>SPC b l 2</kbd> | Create a Linear Process Spec. based off of current buffer using Reg2.
| <kbd>SPC b l 3</kbd> | Create a Linear Process Spec. based off of current buffer using Stack.
| <kbd>SPC b t</kbd> | Create a Labled Transition System.
| <kbd>SPC b b</kbd> | Create a Parameterized Boolean Equation System using a previously created LTS and a modal formula found at project location "properties/testProp.mcf".
| <kbd>SPC c</kbd> | Model Check using PBESolve on your created PBES and LTS.
| <kbd>SPC s</kbd> | Open LPSXSim trace simulator using previously created LPS.
| <kbd>SPC g</kbd> | Open LTSGraph with previously created LTS.
| <kbd>SPC e</kbd> | Open LTSGraph with evidence created from Model Checking via PBESolve.



Installation
==============
Clone this layer into your '~/.emacs.d/private'. Then simply add 'mCRL2' as one of your configuration layers in your spacemacs config.

