grow = {}		--  ��ֲ���

-- ��ò�������   ���룺1 - 10000    �������������
grow.GetOutputNum = function( random_num )
	
	if( random_num>=9501 ) then
		return 5
	elseif( random_num>=8501 ) then
		return 4
	elseif( random_num>=5001 ) then
		return 3
	elseif( random_num>=1 ) then
		return 2
	else
		return 0
	end
	
end

