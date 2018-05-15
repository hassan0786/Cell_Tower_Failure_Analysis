M = csvread('orange_csv.txt');
plot(M(:,1), M(:,2), '--b', 'MarkerSize',10)
 
     fname = 'orange_csv.txt';
     fid = fopen(fname);
     C = textscan(fid);
     fclose(fid);
clear
close all
clc
 filestr = fileread('raw_data.txt'); Read the string from file
 filebyline = regexp(filestr, ' ', 'split');  Split each coordinate sample
 filebyline( cellfun(@isempty,filebyline) ) = [];     create an array strut to be popped later
 filebyfield = regexp(filebyline, '\,', 'split');     separate latitute and longitude (delimited by comma)
 numfields = cellfun(@length, filebyfield);           check if all vals are alphanumeric (omit garbage)
 maxfields = max(numfields);                          length of total sample cooridnates
 fieldpattern = repmat({[]}, 1, maxfields);           length of non-alphanumeric vals
 firstN = @(S,N) S(1:N);                              get the first val from the struct
 filebyfield = cellfun(@(S) firstN([S,fieldpattern], maxfields), filebyfield, 'Uniform', 0); 
 fieldarray = vertcat(filebyfield{:});
 
 numarray = str2double(fieldarray);
numarray(:,1) = boundary_x';
numarray(:,2) = boundary_y' ;
