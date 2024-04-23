classdef ML_3223004558 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure               matlab.ui.Figure
        EditField_2            matlab.ui.control.EditField
        Label_22               matlab.ui.control.Label
        Label_21               matlab.ui.control.Label
        Label_20               matlab.ui.control.Label
        DRAWButton             matlab.ui.control.Button
        ZtoEditField           matlab.ui.control.NumericEditField
        ZtoEditFieldLabel      matlab.ui.control.Label
        ZfromEditField         matlab.ui.control.NumericEditField
        ZfromEditFieldLabel    matlab.ui.control.Label
        Label_19               matlab.ui.control.Label
        Label_18               matlab.ui.control.Label
        Label_17               matlab.ui.control.Label
        YtoEditField_2         matlab.ui.control.NumericEditField
        YtoEditField_2Label    matlab.ui.control.Label
        XtoEditField_2         matlab.ui.control.NumericEditField
        XtoEditField_2Label    matlab.ui.control.Label
        YfromEditField_2       matlab.ui.control.NumericEditField
        YfromEditField_2Label  matlab.ui.control.Label
        XfromEditField_3       matlab.ui.control.NumericEditField
        XfromEditField_3Label  matlab.ui.control.Label
        Label_16               matlab.ui.control.Label
        Label_15               matlab.ui.control.Label
        Label_14               matlab.ui.control.Label
        Label_13               matlab.ui.control.Label
        Label_12               matlab.ui.control.Label
        Label_11               matlab.ui.control.Label
        Label_10               matlab.ui.control.Label
        Label_8                matlab.ui.control.Label
        Label_7                matlab.ui.control.Label
        Label_6                matlab.ui.control.Label
        Label_5                matlab.ui.control.Label
        Label_4                matlab.ui.control.Label
        Label_3                matlab.ui.control.Label
        Label_2                matlab.ui.control.Label
        DButton_3              matlab.ui.control.StateButton
        YtoEditField           matlab.ui.control.NumericEditField
        YtoEditFieldLabel      matlab.ui.control.Label
        XtoEditField           matlab.ui.control.NumericEditField
        XtoEditFieldLabel      matlab.ui.control.Label
        YfromEditField         matlab.ui.control.NumericEditField
        YfromEditFieldLabel    matlab.ui.control.Label
        XfromEditField_2       matlab.ui.control.NumericEditField
        XfromEditField_2Label  matlab.ui.control.Label
        DButton_2              matlab.ui.control.StateButton
        EditField              matlab.ui.control.EditField
        Label                  matlab.ui.control.Label
        UIAxes3                matlab.ui.control.UIAxes
        UIAxes2_2              matlab.ui.control.UIAxes
        UIAxes2                matlab.ui.control.UIAxes
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Value changed function: EditField
        function FunName(app, event)
            FunValue =strcat('@(x,y)',app.EditField.Value);
            f = str2func(FunValue);
        end

        % Value changed function: DButton_2
        function touch03(app, event)
            FunValue =strcat('@(x,y)',app.EditField.Value);
            f = str2func(FunValue);
            Xmin = app.XfromEditField_2.Value;
            Xmax = app.XtoEditField.Value;
            Ymin = app.YfromEditField.Value;
            Ymax = app.YtoEditField.Value;
            ezmesh(app.UIAxes2_2,f,[Xmin,Xmax,Ymin,Ymax])
        end

        % Value changed function: DButton_3
        function touch02(app, event)
            FunValue =strcat('@(x,y)',app.EditField.Value);
            f = str2func(FunValue);
            Xmin = app.XfromEditField_2.Value;
            Xmax = app.XtoEditField.Value;
            Ymin = app.YfromEditField.Value;
            Ymax = app.YtoEditField.Value;
            ezplot(app.UIAxes2,f,[Xmin,Xmax,Ymin,Ymax])
        end

        % Button pushed function: DRAWButton
        function Draw3(app, event)
            Fun = strcat('@(x,y,z)',app.EditField_2.Value);
            fun = str2func(Fun);
            xmin = app.XfromEditField_2.Value;
            xmax = app.XtoEditField_2.Value;
            ymin = app.YfromEditField_2.Value;
            ymax = app.YtoEditField_2.Value;
            zmin = app.ZfromEditField.Value;
            zmax = app.ZtoEditField.Value;
            interval = [xmin,xmax,ymin,ymax,zmin,zmax];
            
            fimplicit3(app.UIAxes3,fun,interval,'EdgeColor','none')
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 651 721];
            app.UIFigure.Name = 'MATLAB App';

            % Create UIAxes2
            app.UIAxes2 = uiaxes(app.UIFigure);
            title(app.UIAxes2, '2D')
            xlabel(app.UIAxes2, 'X')
            ylabel(app.UIAxes2, 'Y')
            zlabel(app.UIAxes2, 'Z')
            app.UIAxes2.Position = [323 529 237 184];

            % Create UIAxes2_2
            app.UIAxes2_2 = uiaxes(app.UIFigure);
            title(app.UIAxes2_2, '3D')
            xlabel(app.UIAxes2_2, 'X')
            ylabel(app.UIAxes2_2, 'Y')
            zlabel(app.UIAxes2_2, 'Z')
            app.UIAxes2_2.Position = [364 359 234 171];

            % Create UIAxes3
            app.UIAxes3 = uiaxes(app.UIFigure);
            title(app.UIAxes3, 'Title')
            xlabel(app.UIAxes3, 'X')
            ylabel(app.UIAxes3, 'Y')
            zlabel(app.UIAxes3, 'Z')
            app.UIAxes3.Position = [375 52 255 227];

            % Create Label
            app.Label = uilabel(app.UIFigure);
            app.Label.HorizontalAlignment = 'right';
            app.Label.Position = [134 680 53 22];
            app.Label.Text = '二元函数';

            % Create EditField
            app.EditField = uieditfield(app.UIFigure, 'text');
            app.EditField.ValueChangedFcn = createCallbackFcn(app, @FunName, true);
            app.EditField.HorizontalAlignment = 'center';
            app.EditField.Position = [91 644 140 38];
            app.EditField.Value = 'x^2+y^2-4';

            % Create DButton_2
            app.DButton_2 = uibutton(app.UIFigure, 'state');
            app.DButton_2.ValueChangedFcn = createCallbackFcn(app, @touch03, true);
            app.DButton_2.Text = '3D';
            app.DButton_2.Position = [201 408 72 44];

            % Create XfromEditField_2Label
            app.XfromEditField_2Label = uilabel(app.UIFigure);
            app.XfromEditField_2Label.HorizontalAlignment = 'right';
            app.XfromEditField_2Label.Position = [76 608 39 22];
            app.XfromEditField_2Label.Text = 'X from';

            % Create XfromEditField_2
            app.XfromEditField_2 = uieditfield(app.UIFigure, 'numeric');
            app.XfromEditField_2.HorizontalAlignment = 'center';
            app.XfromEditField_2.Position = [43 570 106 39];
            app.XfromEditField_2.Value = -10;

            % Create YfromEditFieldLabel
            app.YfromEditFieldLabel = uilabel(app.UIFigure);
            app.YfromEditFieldLabel.HorizontalAlignment = 'right';
            app.YfromEditFieldLabel.Position = [75 530 40 22];
            app.YfromEditFieldLabel.Text = 'Y from';

            % Create YfromEditField
            app.YfromEditField = uieditfield(app.UIFigure, 'numeric');
            app.YfromEditField.HorizontalAlignment = 'center';
            app.YfromEditField.Position = [43 492 106 39];
            app.YfromEditField.Value = -10;

            % Create XtoEditFieldLabel
            app.XtoEditFieldLabel = uilabel(app.UIFigure);
            app.XtoEditFieldLabel.HorizontalAlignment = 'right';
            app.XtoEditFieldLabel.Position = [221 609 25 22];
            app.XtoEditFieldLabel.Text = 'X to';

            % Create XtoEditField
            app.XtoEditField = uieditfield(app.UIFigure, 'numeric');
            app.XtoEditField.HorizontalAlignment = 'center';
            app.XtoEditField.Position = [181 570 106 39];
            app.XtoEditField.Value = 10;

            % Create YtoEditFieldLabel
            app.YtoEditFieldLabel = uilabel(app.UIFigure);
            app.YtoEditFieldLabel.HorizontalAlignment = 'right';
            app.YtoEditFieldLabel.Position = [220 531 26 22];
            app.YtoEditFieldLabel.Text = 'Y to';

            % Create YtoEditField
            app.YtoEditField = uieditfield(app.UIFigure, 'numeric');
            app.YtoEditField.HorizontalAlignment = 'center';
            app.YtoEditField.Position = [181 492 106 39];
            app.YtoEditField.Value = 10;

            % Create DButton_3
            app.DButton_3 = uibutton(app.UIFigure, 'state');
            app.DButton_3.ValueChangedFcn = createCallbackFcn(app, @touch02, true);
            app.DButton_3.Text = '2D';
            app.DButton_3.Position = [68 408 72 44];

            % Create Label_2
            app.Label_2 = uilabel(app.UIFigure);
            app.Label_2.FontSize = 15;
            app.Label_2.FontWeight = 'bold';
            app.Label_2.Position = [234 644 53 37];
            app.Label_2.Text = ' = 0';

            % Create Label_3
            app.Label_3 = uilabel(app.UIFigure);
            app.Label_3.FontSize = 30;
            app.Label_3.Position = [36 571 25 38];
            app.Label_3.Text = '[';

            % Create Label_4
            app.Label_4 = uilabel(app.UIFigure);
            app.Label_4.FontSize = 30;
            app.Label_4.Position = [36 494 25 38];
            app.Label_4.Text = '[';

            % Create Label_5
            app.Label_5 = uilabel(app.UIFigure);
            app.Label_5.FontSize = 30;
            app.Label_5.Position = [157 570 17 39];
            app.Label_5.Text = ',';

            % Create Label_6
            app.Label_6 = uilabel(app.UIFigure);
            app.Label_6.FontSize = 30;
            app.Label_6.Position = [157 492 17 39];
            app.Label_6.Text = ',';

            % Create Label_7
            app.Label_7 = uilabel(app.UIFigure);
            app.Label_7.FontSize = 30;
            app.Label_7.Position = [286 570 25 38];
            app.Label_7.Text = ']';

            % Create Label_8
            app.Label_8 = uilabel(app.UIFigure);
            app.Label_8.FontSize = 30;
            app.Label_8.Position = [286 493 25 38];
            app.Label_8.Text = ']';

            % Create Label_10
            app.Label_10 = uilabel(app.UIFigure);
            app.Label_10.FontSize = 15;
            app.Label_10.FontWeight = 'bold';
            app.Label_10.Position = [239 245 53 37];
            app.Label_10.Text = ' = 0';

            % Create Label_11
            app.Label_11 = uilabel(app.UIFigure);
            app.Label_11.FontSize = 30;
            app.Label_11.Position = [30 183 25 38];
            app.Label_11.Text = '[';

            % Create Label_12
            app.Label_12 = uilabel(app.UIFigure);
            app.Label_12.FontSize = 30;
            app.Label_12.Position = [30 118 25 38];
            app.Label_12.Text = '[';

            % Create Label_13
            app.Label_13 = uilabel(app.UIFigure);
            app.Label_13.FontSize = 30;
            app.Label_13.Position = [151 182 17 39];
            app.Label_13.Text = ',';

            % Create Label_14
            app.Label_14 = uilabel(app.UIFigure);
            app.Label_14.FontSize = 30;
            app.Label_14.Position = [151 116 17 39];
            app.Label_14.Text = ',';

            % Create Label_15
            app.Label_15 = uilabel(app.UIFigure);
            app.Label_15.FontSize = 30;
            app.Label_15.Position = [280 182 25 38];
            app.Label_15.Text = ']';

            % Create Label_16
            app.Label_16 = uilabel(app.UIFigure);
            app.Label_16.FontSize = 30;
            app.Label_16.Position = [280 117 25 38];
            app.Label_16.Text = ']';

            % Create XfromEditField_3Label
            app.XfromEditField_3Label = uilabel(app.UIFigure);
            app.XfromEditField_3Label.HorizontalAlignment = 'right';
            app.XfromEditField_3Label.Position = [70 220 39 22];
            app.XfromEditField_3Label.Text = 'X from';

            % Create XfromEditField_3
            app.XfromEditField_3 = uieditfield(app.UIFigure, 'numeric');
            app.XfromEditField_3.HorizontalAlignment = 'center';
            app.XfromEditField_3.Position = [37 182 106 39];
            app.XfromEditField_3.Value = -10;

            % Create YfromEditField_2Label
            app.YfromEditField_2Label = uilabel(app.UIFigure);
            app.YfromEditField_2Label.HorizontalAlignment = 'right';
            app.YfromEditField_2Label.Position = [69 154 40 22];
            app.YfromEditField_2Label.Text = 'Y from';

            % Create YfromEditField_2
            app.YfromEditField_2 = uieditfield(app.UIFigure, 'numeric');
            app.YfromEditField_2.HorizontalAlignment = 'center';
            app.YfromEditField_2.Position = [37 116 106 39];
            app.YfromEditField_2.Value = -10;

            % Create XtoEditField_2Label
            app.XtoEditField_2Label = uilabel(app.UIFigure);
            app.XtoEditField_2Label.HorizontalAlignment = 'right';
            app.XtoEditField_2Label.Position = [215 221 25 22];
            app.XtoEditField_2Label.Text = 'X to';

            % Create XtoEditField_2
            app.XtoEditField_2 = uieditfield(app.UIFigure, 'numeric');
            app.XtoEditField_2.HorizontalAlignment = 'center';
            app.XtoEditField_2.Position = [175 182 106 39];
            app.XtoEditField_2.Value = 10;

            % Create YtoEditField_2Label
            app.YtoEditField_2Label = uilabel(app.UIFigure);
            app.YtoEditField_2Label.HorizontalAlignment = 'right';
            app.YtoEditField_2Label.Position = [214 155 26 22];
            app.YtoEditField_2Label.Text = 'Y to';

            % Create YtoEditField_2
            app.YtoEditField_2 = uieditfield(app.UIFigure, 'numeric');
            app.YtoEditField_2.HorizontalAlignment = 'center';
            app.YtoEditField_2.Position = [175 116 106 39];
            app.YtoEditField_2.Value = 10;

            % Create Label_17
            app.Label_17 = uilabel(app.UIFigure);
            app.Label_17.FontSize = 30;
            app.Label_17.Position = [30 48 25 38];
            app.Label_17.Text = '[';

            % Create Label_18
            app.Label_18 = uilabel(app.UIFigure);
            app.Label_18.FontSize = 30;
            app.Label_18.Position = [151 46 17 39];
            app.Label_18.Text = ',';

            % Create Label_19
            app.Label_19 = uilabel(app.UIFigure);
            app.Label_19.FontSize = 30;
            app.Label_19.Position = [280 47 25 38];
            app.Label_19.Text = ']';

            % Create ZfromEditFieldLabel
            app.ZfromEditFieldLabel = uilabel(app.UIFigure);
            app.ZfromEditFieldLabel.HorizontalAlignment = 'right';
            app.ZfromEditFieldLabel.Position = [69 84 40 22];
            app.ZfromEditFieldLabel.Text = 'Z from';

            % Create ZfromEditField
            app.ZfromEditField = uieditfield(app.UIFigure, 'numeric');
            app.ZfromEditField.HorizontalAlignment = 'center';
            app.ZfromEditField.Position = [37 46 106 39];
            app.ZfromEditField.Value = -10;

            % Create ZtoEditFieldLabel
            app.ZtoEditFieldLabel = uilabel(app.UIFigure);
            app.ZtoEditFieldLabel.HorizontalAlignment = 'right';
            app.ZtoEditFieldLabel.Position = [214 85 26 22];
            app.ZtoEditFieldLabel.Text = 'Z to';

            % Create ZtoEditField
            app.ZtoEditField = uieditfield(app.UIFigure, 'numeric');
            app.ZtoEditField.HorizontalAlignment = 'center';
            app.ZtoEditField.Position = [175 46 106 39];
            app.ZtoEditField.Value = 10;

            % Create DRAWButton
            app.DRAWButton = uibutton(app.UIFigure, 'push');
            app.DRAWButton.ButtonPushedFcn = createCallbackFcn(app, @Draw3, true);
            app.DRAWButton.Position = [310 129 56 74];
            app.DRAWButton.Text = 'DRAW';

            % Create Label_20
            app.Label_20 = uilabel(app.UIFigure);
            app.Label_20.Position = [-220 750 2 2];

            % Create Label_21
            app.Label_21 = uilabel(app.UIFigure);
            app.Label_21.FontWeight = 'bold';
            app.Label_21.Position = [1 325 692 53];
            app.Label_21.Text = '——————————————————————————————————————————————————————';

            % Create Label_22
            app.Label_22 = uilabel(app.UIFigure);
            app.Label_22.HorizontalAlignment = 'right';
            app.Label_22.Position = [133 280 53 22];
            app.Label_22.Text = '三元函数';

            % Create EditField_2
            app.EditField_2 = uieditfield(app.UIFigure, 'text');
            app.EditField_2.HorizontalAlignment = 'center';
            app.EditField_2.Position = [90 245 140 38];
            app.EditField_2.Value = 'x^2+y^2+z^2-4';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = ML_3223004558

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end