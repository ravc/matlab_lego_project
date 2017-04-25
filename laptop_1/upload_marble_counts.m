function upload_marble_counts( marbleCounts )
% write array to file data.txt
outFid = fopen('data.txt', 'w');
fprintf(outFid, '%d\n', marbleCounts);
fclose(outFid);
% upload file to git
system('git add data.txt');
system('git commit -m "marble counts"');
system('git push');
end

